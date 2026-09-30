const std = @import("std");
const c = @import("c");
const testServer = @import("testServer");

const util = @import("util.zig");
const errors = @import("errors.zig");
const ziglings = @import("ziglings.zig");

const Diagnostic = @import("Diagnostics.zig");

const Headers = @import("root.zig").Headers;
const InfoType = @import("root.zig").InfoType;
const Curl = @import("root.zig").Curl;
const Socket = @import("root.zig").Socket;

const Self = @This();

/// pointer to curl easy
handle: *Curl,
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
    status_code: u32, // NOTE: later add status enum and status class
    handle: *Curl,

    fn PolyFill_curl_header() type {
        if (comptime util.hasHeaderSupport()) {
            return c.struct_curl_header;
        } else return struct {
            value: [:0]const u8,
        };
    }

    pub const Header = struct {
        header: *PolyFill_curl_header(),
        name: []const u8,

        /// get the header value as slice
        pub fn getValue(self: Header) []const u8 {
            return std.mem.span(self.header.value);
        }
    };

    pub fn getHeader(self: Response, name: [:0]const u8) errors.HeaderErrors!?Header {
        util.expectHeaderSupport(@src());

        var header: ?*c.struct_curl_header = null;

        return Response.getHeaderInner(
            self.handle,
            name,
            -1,
            &header,
        );
    }

    fn getHeaderInner(
        easy: *Curl,
        name: [:0]const u8,
        request: c_int,
        hout: *?*c.struct_curl_header,
    ) errors.HeaderErrors!?Header {
        const code = c.curl_easy_header(
            easy,
            name.ptr,
            0,
            c.CURLH_HEADER,
            request,
            hout,
        );
        errors.headerFrom(code) catch |err| switch (err) {
            error.Missing, error.NoHeaders => return null,
            else => return err,
        };
        return .{
            .header = hout.*.?,
            .name = name,
        };
    }

    /// for iterating over response header if there is a redirect
    pub const HeaderIterator = struct {
        handle: *Curl,
        name: ?[:0]const u8,
        request: ?usize = null, // if null use -1 (last)
        header: ?*PolyFill_curl_header() = null,

        pub fn next(self: *HeaderIterator) !?Header {
            util.expectHeaderSupport(@src());

            const request: c_int = @intCast(self.request orelse -1);

            if (self.name) |filter_name| {
                if (self.header) |h| {
                    if (h.*.index + 1 == h.*.amount) {
                        return null;
                    }
                } else {
                    return Response.getHeaderInner(self.handle, filter_name, request, &self.header);
                }
            }

            while (c.curl_easy_nextheader(
                self.handle,
                c.CURLH_HEADER,
                request,
                self.header,
            )) |h| {
                self.header = h;

                const name = std.mem.span(h.*.name);
                if (self.name) |filter_name| {
                    if (!std.ascii.eqlIgnoreCase(name, filter_name))
                        continue;
                }

                return Header{
                    .header = h,
                    .name = name,
                };
            }
            return null;
        }
    };

    pub const IteratorOptions = struct {
        /// iterate over headers matching specific names
        name: ?[:0]const u8 = null,
        /// which request index you want to iterate over, if left empty then it is the last one
        request: ?usize = null,
    };

    pub fn iterateHeaders(self: Response, options: IteratorOptions) HeaderIterator {
        util.expectHeaderSupport(@src());

        return HeaderIterator{
            .handle = self.handle,
            .name = options.name,
            .request = options.request,
        };
    }

    /// get how many times does this request is redirected
    pub fn getRedirectCount(self: Response, diagnostic: *Diagnostic) !usize {
        var redirects: c_long = 0;
        try diagnostic.checkError(c.curl_easy_getinfo(self.handle, c.CURLINFO_REDIRECT_COUNT, &redirects));
        return @intCast(redirects);
    }
};

pub const Info = enum(c_int) {
    active_socket = c.CURLINFO_ACTIVESOCKET,
    private = c.CURLINFO_PRIVATE,
    response_code = c.CURLINFO_RESPONSE_CODE,

    fn ParamType(self: Info) type {
        return switch (self) {
            .active_socket => *Socket,
            .private => ?*anyopaque,
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

pub const Pause = enum(c_int) {
    recv = c.CURLPAUSE_RECV,
    send = c.CURLPAUSE_SEND,
    all = c.CURLPAUSE_ALL,
    cont_all = c.CURLPAUSE_CONT,
    cont_recv = c.CURLPAUSE_RECV_CONT,
    cont_send = c.CURLPAUSE_SEND_CONT,
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

/// memory is allocated by libcurl therefore use curl.free() to free it's memory
pub inline fn escape(self: *Self, string: [:0]const u8) []const u8 {
    return std.mem.span(c.curl_easy_escape(self.handle, string.ptr, string.len));
}

pub inline fn pause(self: *Self, action: Pause) !void {
    try self.diagnostic.checkError(c.curl_easy_pause(self.handle, @intFromEnum(action)));
}

// pub inline fn setRedirect(self: *Self) !void {
//     c.curl_easy_setopt(self.handle, c.CURLOPT_FOLLOWLOCATION, )
// }

pub inline fn setMethod(self: *Self, method: Method) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_CUSTOMREQUEST, method.toString().ptr));
}

pub inline fn setPostField(self: *Self, body: []const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDS, body.ptr));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDSIZE, body.len));
}

pub inline fn dupHandle(self: *Self) !*Curl {
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
                .data = c.CURLOPT_CLOSESOCKETDATA,
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

pub inline fn getInfo(self: *Self, comptime info: Info, arg: info.ParamType()) !void {
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
pub fn wrap(handle: *Curl, opt: Options) Self {
    return Self{
        .handle = handle,
        .diagnostic = .{},
        .timeout_ms = opt.default_timeout_ms,
        .user_agent = opt.default_user_agent,
    };
}

pub const Swap = union(enum) {
    handle: *Curl,
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

test "fetch and response" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    defer @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    const res = easy.fetch(testServer.server_url, .{ .method = .GET }) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };

    const res_header = try res.getHeader("Content-Type") orelse return;

    try std.testing.expectEqualSlices(u8, "Content-Type", res_header.name);
    try std.testing.expectEqualSlices(u8, "text/plain", res_header.getValue());
}

test "swap and wrap" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    defer @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    const pref = easy.handle;
    try std.testing.expect(pref == easy.handle);

    var new_easy = try Self.init(.{});
    defer new_easy.deinit();
    easy.swapField(.{ .handle = new_easy.handle });

    try std.testing.expect(easy.handle != pref);

    var wrap_easy = Self.wrap(pref, .{});
    defer wrap_easy.deinit();

    try wrap_easy.setUrl(testServer.server_url);
    try wrap_easy.setMethod(.GET);

    _ = wrap_easy.perform() catch |err| {
        std.testing.failPrint("{s}: {?s}\n", .{
            testServer.server_url,
            wrap_easy.diagnostic.getMessage(),
        });
        return err;
    };
}

test "setCallback" {
    try testServer.ensureRunning();

    try @import("root.zig").global.init(.all);
    defer @import("root.zig").global.deinit();

    var easy = try Self.init(.{});
    defer easy.deinit();

    easy.setCallback(.write, discard_write_callback, null) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
}
