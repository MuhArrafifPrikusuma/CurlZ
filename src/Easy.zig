const std = @import("std");
const c = @import("c");
const ziglings = @import("ziglings.zig");

const testServer = @import("testServer");

const Diagnostic = @import("Diagnostics.zig");

const Headers = @import("root.zig").Headers;
const InfoType = @import("root.zig").InfoType;

const Self = @This();

const Socket = c_int;

/// pointer to curl easy
handle: *c.CURL,
timeout_ms: usize,
user_agent: [:0]const u8,
diagnostic: Diagnostic,

pub const Method = enum {
    GET,
    POST,
    PUT,
    HEAD,
    PATCH,
    DELETE,

    fn toString(self: Method) [:0]const u8 {
        return @tagName(self);
    }
};

pub const FetchOptions = struct {
    method: Method = .GET,
    body: ?[]const u8 = null,
    /// used to store headers data in here before user call fetch to then pass this headers
    /// arrays to Headers type
    headers: ?[][:0]const u8 = null,
    /// for writing response body
    writer: ?*std.Io.Writer = null,
};

pub const Response = struct {
    status_code: u32,

    handle: *c.CURL,
};

pub const Info = enum(c_int) {
    active_socket = c.CURLINFO_ACTIVESOCKET,
    private = c.CURLINFO_PRIVATE,
    response_code = c.CURLINFO_RESPONSE_CODE,

    fn ArgType(self: Info) type {
        return switch (self) {
            .active_socket => *Socket,
            .private => *anyopaque,
            .response_code => *c_long,
        };
    }
};

/// Init options for easy handle
pub const Options = struct {
    /// default 60 second
    default_timeout_ms: usize = 60_000,
    /// NOTE: add version number later
    default_user_agent: [:0]const u8 = "CurlZ/" ++ @import("build_info").version,
};

/// initiate easy interface
pub inline fn init(opt: Options) !Self {
    return Self{
        .handle = c.curl_easy_init() orelse return error.CurlInit,
        .diagnostic = .{},
        .timeout_ms = opt.default_timeout_ms,
        .user_agent = opt.default_user_agent,
    };
}

pub inline fn deinit(self: *Self) void {
    c.curl_easy_cleanup(self.handle);
}

pub inline fn setUrl(self: *Self, url: [:0]const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_URL, url.ptr));
}

pub inline fn setMethod(self: *Self, method: Method) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_CUSTOMREQUEST, method.toString().ptr));
}

pub inline fn setPostField(self: *Self, body: []const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDS, body.ptr));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDSIZE, body.len));
}

pub inline fn dupHandle(self: *Self) !*c.CURL {
    return c.curl_easy_duphandle(self.handle) orelse error.CurlInit;
}

pub const Callback = enum(c_int) {
    write = c.CURLOPT_WRITEFUNCTION,
    read = c.CURLOPT_READFUNCTION,
    header = c.CURLOPT_HEADERFUNCTION,

    close_socket = c.CURLOPT_CLOSESOCKETFUNCTION,

    debug = c.CURLOPT_DEBUGFUNCTION,

    pub fn signature(self: Callback) struct {
        callback_func: type,
        data: c_int,
    } {
        return switch (self) {
            .write => .{
                .callback_func = *const fn ([*:0]const u8, usize, usize, ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_WRITEDATA,
            },
            .read => .{
                .callback_func = *const fn ([*:0]u8, usize, usize, ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_READDATA,
            },
            .header => .{
                .callback_func = *const fn ([*:0]u8, usize, usize, ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_HEADERDATA,
            },
            .close_socket => .{
                .callback_func = *const fn (?*anyopaque, c.curl_socket_t) callconv(.c) c_int,
                .data = c.CURLOPT_HEADERDATA,
            },
            .debug => .{
                .callback_func = *const fn (*c.CURL, InfoType, [*:0]u8, usize, ?*anyopaque) callconv(.c) c_int,
                .data = c.CURLOPT_DEBUGDATA,
            },
        };
    }
};

pub inline fn setCallback(
    self: *Self,
    comptime cb: Callback,
    func: cb.signature().callback_func,
    data: ?*anyopaque,
) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, @as(c_int, @intFromEnum(cb)), func));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, @as(c_int, cb.signature().data), data));
}

pub inline fn getInfo(self: *Self, comptime info: Info, arg: info.ArgType()) !void {
    try self.diagnostic.checkError(c.curl_easy_getinfo(self.handle, @intFromEnum(info), arg));
}

pub fn perform(self: *Self) !Response {
    try self.setCommonOpt();
    try self.diagnostic.checkError(c.curl_easy_perform(self.handle));

    var status_code: c_long = 0;
    try self.getInfo(.response_code, &status_code);
    return Response{
        .handle = self.handle,
        .status_code = @intCast(status_code),
    };
}

/// wrap an existing easy handle
pub fn wrap(handle: *c.CURL, opt: Options) Self {
    return Self{
        .handle = handle,
        .diagnostic = .{},
        .timeout_ms = opt.default_timeout_ms,
        .user_agent = opt.default_user_agent,
    };
}

pub const Swap = union(enum) {
    handle: *c.CURL,
    opt: Options,
};

pub fn swapField(self: *Self, swap: Swap) void {
    switch (swap) {
        .opt => |opt| {
            self.timeout_ms = opt.default_timeout_ms;
            self.user_agent = opt.default_user_agent;
        },
        .handle => |h| self.handle = h,
    }
}

/// send request from fetchoptions to the specified url
pub fn fetch(self: *Self, url: [:0]const u8, opt: FetchOptions) !Response {
    try self.setUrl(url);
    try self.setMethod(opt.method);
    if (opt.body) |body| {
        try self.setPostField(body);
    }

    var headers: ?Headers = null;
    if (opt.headers) |header_slice| {
        headers = .{};
        for (header_slice) |header| {
            try headers.?.add(header);
        }
    }
    defer if (headers) |h| {
        h.deinit();
    };

    return try self.perform();
}

/// pass to setCallback(.write) to discard responses
/// instead of writing to stdout
pub fn discard_write_callback(
    ptr: [*:0]const u8,
    size: usize,
    nmemb: usize,
    userdata: ?*anyopaque,
) callconv(.c) usize {
    _ = ptr;
    _ = size;
    _ = userdata;
    return nmemb;
}

pub inline fn setCommonOpt(self: *Self) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_TIMEOUT_MS, self.timeout_ms));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_USERAGENT, self.user_agent.ptr));
}

test "fetch" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    defer @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    const res = easy.fetch(testServer.server_url, .{ .method = .GET }) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
    _ = res;
}

test "swap and wrap" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    const pref = easy.handle;
    try std.testing.expect(pref == easy.handle);

    var new_easy = try Self.init(.{});
    defer new_easy.deinit();
    easy.swapField(.{ .handle = new_easy.handle });

    try std.testing.expect(easy.handle != pref);

    var wrap_easy = Self.wrap(pref, .{});

    try wrap_easy.setUrl(testServer.server_url);
    try wrap_easy.setMethod(.GET);

    _ = wrap_easy.perform() catch |err| {
        std.testing.failPrint("{s}: {?s}\n", .{ testServer.server_url, wrap_easy.diagnostic.getMessage() });
        return err;
    };
}

test "setCallback" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    easy.setCallback(.write, discard_write_callback, null) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
}
