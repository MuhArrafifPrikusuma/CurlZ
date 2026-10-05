const std = @import("std");
const c = @import("c");
const testing = @import("testing");

const Easy = @import("Easy.zig");
const Diagnostic = @import("Diagnostics.zig");

const Mime = @import("root.zig").Mime;
const Curl = @import("root.zig").Curl;

const HandleOrWrapper = Easy.HandleOrWrapper;

const Self = @This();

pub const FreeCallback = *const fn (ptr: ?*anyopaque) callconv(.c) void;

mime_handle: *Mime,
diagnostic: *Diagnostic,

pub const NonCopying = struct {
    size: usize,
    ptr: *anyopaque,
    vtable: *const VTable,

    const VTable = struct {
        /// ?*const fn (buffer: ?[*:0]u8, size: usize, nitems: usize, userdata: ?*anyopaque) callconv(.c) usize
        read: ?Easy.Callback.read.signature().callback_func,
        /// ?*const fn (clientp: ?*anyopaque, offset: c.curl_off_t, origin: c_int) callconv(.c) c_int
        seek: ?Easy.Callback.seek.signature().callback_func,
        /// ?*const fn (ptr: *anyopaque) callconv(.c) void
        free: ?FreeCallback,
    };

    /// use this when memory is already in ram
    pub const SliceBased = struct {
        data: Data,

        pub const Data = struct {
            slice: []const u8,
            offset: usize = 0,
        };

        pub fn nonCopying(self: *SliceBased) NonCopying {
            return .{
                .size = self.data.slice.len,
                .ptr = @ptrCast(&self.data),
                .vtable = &.{
                    .read = read,
                    .seek = seek,
                    .free = null,
                },
            };
        }

        fn read(
            buffer: ?[*:0]u8,
            size: usize,
            nitems: usize,
            userdata: ?*anyopaque,
        ) callconv(.c) usize {
            var source: *Data = @ptrCast(@alignCast(userdata orelse return c.CURL_READFUNC_ABORT));
            const to_read = @min(size * nitems, source.slice.len - source.offset);

            if (to_read == 0) return 0;

            var b = buffer orelse return c.CURL_READFUNC_ABORT;
            @memmove(b[0..to_read], source.slice[source.offset .. source.offset + to_read]);
            source.offset += to_read;
            return to_read;
        }

        fn seek(clientp: ?*anyopaque, offset: c.curl_off_t, origin: c_int) callconv(.c) c_int {
            var source: *Data = @ptrCast(@alignCast(clientp orelse return c.CURL_SEEKFUNC_FAIL));
            const new_pos = switch (origin) {
                c.SEEK_SET => offset,
                c.SEEK_CUR => offset + @as(c.curl_off_t, @intCast(source.offset)),
                else => c.CURL_SEEKFUNC_FAIL,
            };
            if (new_pos < 0) {
                return c.CURL_SEEKFUNC_FAIL;
            }
            const new_offset = @as(usize, @intCast(new_pos));
            if (new_offset > source.slice.len) {
                return c.CURL_SEEKFUNC_FAIL;
            }
            source.offset = new_offset;
            return c.CURL_SEEKFUNC_OK;
        }
    };

    /// use this when reading from disk
    pub const ReaderBased = struct {
        reader: *std.Io.Reader,
        size: usize,

        pub fn nonCopying(self: *ReaderBased) NonCopying {
            return .{
                .size = self.size,
                .ptr = @ptrCast(self.reader),
                .vtable = &.{
                    .read = read,
                    .seek = null,
                    .free = null,
                },
            };
        }

        fn read(
            buffer: ?[*:0]u8,
            size: usize,
            nitems: usize,
            userdata: ?*anyopaque,
        ) callconv(.c) usize {
            var reader: *std.Io.Reader = @ptrCast(@alignCast(userdata orelse return c.CURL_READFUNC_ABORT));
            const to_read = size * nitems;
            var b = buffer orelse return c.CURL_READFUNC_ABORT;
            const n = reader.readSliceShort(b[0..to_read]) catch return c.CURL_READFUNC_ABORT;
            return n;
        }
    };
};

pub const DataSource = union(enum) {
    data: []const u8,
    file: [:0]const u8,
    non_copying: *const NonCopying,
};

pub fn init(easy: HandleOrWrapper, diagnostic: *Diagnostic) !Self {
    const handle = switch (easy) {
        .handle => |hndl| hndl,
        .wrapper => |wrpr| wrpr.handle,
    };
    const mime_handle = c.curl_mime_init(handle) orelse return error.MimeInit;
    return .{
        .diagnostic = diagnostic,
        .mime_handle = mime_handle,
    };
}

pub inline fn deinit(self: *Self) void {
    c.curl_mime_free(self.mime_handle);
}

pub fn addPart(self: *Self, name: [:0]const u8, filename: ?[:0]const u8, source: DataSource) !void {
    const part = c.curl_mime_addpart(self.mime_handle) orelse return error.MimeAddPart;

    try self.diagnostic.checkError(c.curl_mime_name(part, name.ptr));
    if (filename) |fname| {
        try self.diagnostic.checkError(c.curl_mime_filename(part, fname.ptr));
    }
    switch (source) {
        .data => |data| try self.diagnostic.checkError(c.curl_mime_data(part, data.ptr, data.len)),
        .file => |filedata| try self.diagnostic.checkError(c.curl_mime_filedata(part, filedata.ptr)),
        .non_copying => |data| try self.diagnostic.checkError(c.curl_mime_data_cb(
            part,
            @as(c_long, @intCast(data.size)),
            data.vtable.read,
            data.vtable.seek,
            data.vtable.free,
            data.ptr,
        )),
    }
}

test "NonCopying.ReaderBased" {
    try testing.server.ensureRunning({});
    try testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all});

    const io = std.testing.io;

    var easy = try Easy.init(.{});
    defer easy.deinit();
    try easy.setUrl(testing.server.server_url);

    var multipart = try Self.init(.{ .wrapper = &easy }, &easy.diagnostic);
    defer multipart.deinit();

    var buf: [8196]u8 = undefined;
    var file = try std.Io.Dir.cwd().openFile(io, "test/goaway.png", .{ .mode = .read_only });
    defer file.close(io);

    var freader = file.reader(io, &buf);
    const reader = &freader.interface;

    const stat = try file.stat(io);

    var reader_based = NonCopying.ReaderBased{ .size = stat.size, .reader = reader };
    const no_cpy = reader_based.nonCopying();

    try multipart.addPart("png", null, .{ .non_copying = &no_cpy });
    try easy.setMultipart(&multipart);

    const res = easy.perform() catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
    try std.testing.expect(res.status_code == .ok);
}

test "NonCopying.SliceBased" {
    try testing.server.ensureRunning({});
    try testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all});

    const io = std.testing.io;
    const allocator = std.testing.allocator;

    var easy = try Easy.init(.{});
    defer easy.deinit();
    try easy.setUrl(testing.server.server_url);

    var multipart = try Self.init(.{ .wrapper = &easy }, &easy.diagnostic);
    defer multipart.deinit();

    var file = try std.Io.Dir.cwd().openFile(io, "test/goaway.png", .{ .mode = .read_only });
    defer file.close(io);

    const stat = try file.stat(io);

    var image_buffer: [4096]u8 = undefined;
    var freader = file.reader(io, &image_buffer);
    const reader = &freader.interface;

    const slice = try reader.readAllocAll(allocator, stat.size);
    defer allocator.free(slice);

    var slice_based = NonCopying.SliceBased{
        .data = .{
            .slice = slice,
            .offset = 0,
        },
    };
    const ncpy = slice_based.nonCopying();

    try multipart.addPart("png", null, .{ .non_copying = &ncpy });

    try easy.setMultipart(&multipart);
    const res = try easy.perform();
    try std.testing.expect(res.status_code == .ok);
}
