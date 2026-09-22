const std = @import("std");
const c = @import("curl.zig");
const ziglings = @import("ziglings.zig");

const Diagnostic = @import("Diagnostics.zig");

const Self = @This();

const Socket = c_int;

const EasyError = error{
    initFailed,
};
/// pointer to curl easy
handle: *c.CURL,
timeout_ms: usize,
user_agent: [:0]const u8,
diagnostic: Diagnostic,

pub const Headers = struct {
    headers: *c.curl_slist = null,

    pub fn deinit(self: *Headers) !void {
        if (self.headers) |h| {
            c.curl_slist_free_all(h);
        }
    }

    pub fn add(self: *Headers, header: [:0]const u8) !void {
        self.headers = c.curl_slist_append(self.headers, header.ptr) orelse return error.Curl_slist_append;
    }
};

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
    responseCode = c.CURLINFO_RESPONSE_CODE,
};

/// Init options for easy handle
pub const Options = struct {
    /// default 60 second
    default_timeout_ms: usize = 60_000,
    /// NOTE: add version number later
    default_user_agent: [:0]const u8 = "CurlZ/",
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

fn InfoArgType(info: Info) type {
    return switch (info) {
        .active_socket => *Socket,
        .private => *anyopaque,
        .responseCode => *c_long,
    };
}

/// NOTE: info will definitely be important later but don't do it know since it would probably take a while
pub inline fn getInfo(self: *Self, comptime info: Info, arg: InfoArgType(info)) !void {
    try self.diagnostic.checkError(c.curl_easy_getinfo(self.handle, @intFromEnum(info), arg));
}

pub fn perform(self: *Self) !Response {
    try self.setCommonOptions();
    try self.diagnostic.checkError(c.curl_easy_perform(self.handle));

    var status_code: c_long = 0;
    try self.getInfo(.responseCode, &status_code);
    return Response{
        .handle = self.handle,
        .status_code = @intCast(status_code),
    };
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

pub inline fn setCommonOptions(self: *Self) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_TIMEOUT_MS, self.timeout_ms));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_USERAGENT, self.user_agent.ptr));
}
