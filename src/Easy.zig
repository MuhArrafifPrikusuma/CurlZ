const std = @import("std");
const c = @import("c");
const testing = @import("testing");

const util = @import("util.zig");
const errors = @import("errors.zig");
const http = @import("http.zig");

const Diagnostic = @import("Diagnostics.zig");
const Multipart = @import("MultiPart.zig");

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
    /// used to store headers data in here before user call fetch to then add this headers
    /// arrays to Headers type
    headers: ?[][:0]const u8 = null,
    /// for writing response body
    writer: ?*std.Io.Writer = null,
};

pub const HandleOrWrapper = union(enum) {
    handle: *Curl,
    wrapper: *Self,
};

pub const Response = struct {
    status_code: http.Status, // NOTE: later add status enum and status class
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
    http_version = c.CURLINFO_HTTP_VERSION,

    fn ReturnType(self: Info) type {
        return switch (self) {
            .active_socket => Socket,
            .private => ?*anyopaque,
            .response_code => http.Status,
            .http_version => http.Versions,
        };
    }

    fn resolveDefaultValue(self: Info) self.ReturnType() {
        return switch (self.ReturnType()) {
            ?*anyopaque => null,
            else => undefined,
        };
    }
};

pub const Options = struct {
    /// default 60 second
    default_timeout_ms: usize = 60_000,
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

pub const Callback = enum(c_int) {
    write = c.CURLOPT_WRITEFUNCTION,
    read = c.CURLOPT_READFUNCTION,
    header = c.CURLOPT_HEADERFUNCTION,
    sockopt = c.CURLOPT_SOCKOPTFUNCTION,
    seek = c.CURLOPT_SEEKFUNCTION,

    open_socket = c.CURLOPT_OPENSOCKETFUNCTION,
    close_socket = c.CURLOPT_CLOSESOCKETFUNCTION,

    debug = c.CURLOPT_DEBUGFUNCTION,

    pub fn signature(self: Callback) struct {
        callback_func: type,
        data: c_int,
    } {
        return switch (self) {
            .write => .{
                .callback_func = *const fn (ptr: ?[*:0]const u8, size: usize, nmemb: usize, userdata: ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_WRITEDATA,
            },
            .read => .{
                .callback_func = *const fn (buffer: ?[*:0]u8, size: usize, nitems: usize, userdata: ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_READDATA,
            },
            .header => .{
                .callback_func = *const fn (buffer: ?[*:0]u8, size: usize, nitems: usize, clientp: ?*anyopaque) callconv(.c) usize,
                .data = c.CURLOPT_HEADERDATA,
            },
            .open_socket => .{
                .callback_func = *const fn (clientp: ?*anyopaque, purpose: c.curlsocktype, address: ?*c.struct_curl_sockaddr) callconv(.c) Socket,
                .data = c.CURLOPT_OPENSOCKETDATA,
            },
            .close_socket => .{
                .callback_func = *const fn (clientp: ?*anyopaque, items: c.curl_socket_t) callconv(.c) c_int,
                .data = c.CURLOPT_CLOSESOCKETDATA,
            },
            .sockopt => .{
                .callback_func = *const fn (clientp: ?*anyopaque, curlfd: Socket, purpose: c.curlsocktype) callconv(.c) c_int,
                .data = c.CURLOPT_SOCKOPTDATA,
            },
            .debug => .{
                .callback_func = *const fn (*Curl, InfoType, ?[*:0]u8, usize, clientp: ?*anyopaque) callconv(.c) c_int,
                .data = c.CURLOPT_DEBUGDATA,
            },
            .seek => .{
                .callback_func = *const fn (clientp: ?*anyopaque, offset: c.curl_off_t, origin: c_int) callconv(.c) c_int,
                .data = c.CURLOPT_SEEKDATA,
            },
        };
    }
};

pub const Follow = enum(c_int) {
    all = c.CURLFOLLOW_ALL,
    first_only = c.CURLFOLLOW_FIRSTONLY,
    obeycode = c.CURLFOLLOW_OBEYCODE,
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

pub inline fn setPostFieldLarge(self: *Self, body: []const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDS, body.ptr));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDSIZE_LARGE, @as(c.curl_off_t, @intCast(body.len))));
}

pub inline fn setPrivate(self: *Self, ptr: *anyopaque) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_PRIVATE, ptr));
}

pub inline fn setEncoding(self: *Self, encoding: [:0]const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_ACCEPT_ENCODING, encoding.ptr));
}

pub inline fn setFollowLocation(self: *Self, mode: Follow) !void {
    util.assertRuntimePanic(
        "libcurl version \x1b[2m'{s}'\x1b[0m does not support \x1b[2m'{s}'\x1b[0m follow mode\n",
        .{ c.LIBCURL_VERSION, @tagName(mode) },
        @backingInt(mode) == c.CURLFOLLOW_ALL,
    );
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_FOLLOWLOCATION, @as(c_long, @intCast(@intFromEnum(mode)))));
}

pub inline fn setMaxRedirects(self: *Self, max: u32) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_MAXREDIRS, @as(c_long, @intCast(max))));
}

pub inline fn setMultipart(self: *Self, multipart: *Multipart) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_MIMEPOST, multipart.mime_handle));
}

pub inline fn setVerbose(self: *Self, verbose: bool) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_VERBOSE, @as(c_long, @intFromBool(verbose))));
}

pub inline fn setHeader(self: *Self, headers: Headers) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_HEADER, headers.list));
}

pub inline fn setKeepAlive(self: *Self) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_TCP_KEEPALIVE, @as(c_long, 1)));
}

/// set keep alive interval
pub inline fn setKeepAliveInvl(self: *Self, invl: usize) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_TCP_KEEPINTVL, @as(c_long, @intCast(invl))));
}

pub inline fn setKeepIdle(self: *Self, time_sec: usize) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_TCP_KEEPIDLE, @as(c_long, @intCast(time_sec))));
}

pub inline fn setHttpVer(self: *Self, http_ver: http.Versions) !void {
    util.runtimeEnsureHttpVersionSupport(http_ver);
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_HTTP_VERSION, @intFromEnum(http_ver)));
}

/// memory is allocated by libcurl therefore use curl.free() to free it's memory
pub inline fn escape(self: *Self, string: [:0]const u8) []const u8 {
    return std.mem.span(c.curl_easy_escape(self.handle, string.ptr, string.len));
}

pub inline fn pause(self: *Self, action: Pause) !void {
    try self.diagnostic.checkError(c.curl_easy_pause(self.handle, @intFromEnum(action)));
}

pub inline fn dupHandle(self: *Self) !*Curl {
    return c.curl_easy_duphandle(self.handle) orelse error.CurlInit;
}

/// set callback function and data pointer, if func is null this function do nothing
pub fn setCallback(
    self: *Self,
    comptime cb: Callback,
    func: ?cb.signature().callback_func,
    data: ?*anyopaque,
) !void {
    if (func) |f| {
        try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, @as(c_int, @intFromEnum(cb)), f));
        try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, @as(c_int, comptime cb.signature().data), data));
    }
}

pub inline fn getInfo(self: *Self, comptime info: Info) !info.ReturnType() {
    var arg: info.ReturnType() = comptime info.resolveDefaultValue();
    try self.diagnostic.checkError(c.curl_easy_getinfo(self.handle, @intFromEnum(info), &arg));
    return arg;
}

pub fn perform(self: *Self) !Response {
    try self.setCommonOpt();
    try self.diagnostic.checkError(c.curl_easy_perform(self.handle));

    const status_code = try self.getInfo(.response_code);
    return Response{
        .handle = self.handle,
        .status_code = status_code,
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
    const headers_non_null = headers orelse return try self.perform();
    try self.setHeader(headers_non_null);
    defer headers_non_null.deinit();

    return try self.perform();
}

/// pass to setCallback(.write) to discard responses
/// instead of writing to stdout
pub fn discard_write_callback(
    ptr: ?[*:0]const u8,
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
    try testing.server.ensureRunning({});
    switch (testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all})) {
        .payload => |payload| try payload,
        .once_set => |once| try once,
    }

    var easy = try Self.init(.{});
    defer easy.deinit();

    const res = easy.fetch(testing.server.server_url, .{ .method = .GET }) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };

    const res_header = try res.getHeader("Content-Type") orelse return;

    try std.testing.expectEqualSlices(u8, "Content-Type", res_header.name);
    try std.testing.expectEqualSlices(u8, "text/plain", res_header.getValue());
}

test "swap and wrap" {
    try testing.server.ensureRunning({});
    switch (testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all})) {
        .payload => |payload| try payload,
        .once_set => |once| try once,
    }

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

    try wrap_easy.setUrl(testing.server.server_url);
    try wrap_easy.setMethod(.GET);

    _ = wrap_easy.perform() catch |err| {
        std.testing.failPrint("{s}: {?s}\n", .{
            testing.server.server_url,
            wrap_easy.diagnostic.getMessage(),
        });
        return err;
    };
}

test "setCallback and http ver" {
    try testing.server.ensureRunning({});
    switch (testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all})) {
        .payload => |payload| try payload,
        .once_set => |once| try once,
    }

    var easy = try Self.init(.{});
    defer easy.deinit();

    try easy.setHttpVer(.@"1.1");
    try easy.setUrl(testing.server.server_url);

    easy.setCallback(.write, discard_write_callback, null) catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
    const res = easy.perform() catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };

    const ver = try easy.getInfo(.http_version);
    try std.testing.expect(res.status_code == .ok);
    try std.testing.expect(ver == .@"1.1");
}

test "setPrivate" {
    try testing.server.ensureRunning({});
    switch (testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all})) {
        .payload => |payload| try payload,
        .once_set => |once| try once,
    }

    var easy = try Self.init(.{});
    defer easy.deinit();

    const PrivateData = struct { datstr: [:0]const u8, randomNumber: c_int };
    const priv = PrivateData{
        .datstr = "Hwellow",
        .randomNumber = 22,
    };
    try easy.setUrl(testing.server.server_url);
    try easy.setPrivate(@ptrCast(@constCast(&priv)));

    const res = easy.perform() catch |err| {
        std.testing.failPrint("{?s}\n", .{easy.diagnostic.getMessage()});
        return err;
    };
    try std.testing.expect(res.status_code == .ok);

    const get_priv: *PrivateData = @ptrCast(@alignCast(try easy.getInfo(.private)));
    try std.testing.expectEqualSlices(u8, "Hwellow", get_priv.datstr);
    try std.testing.expect(get_priv.randomNumber == 22);
}
