const std = @import("std");
const c = @import("curl.zig");
const ziglings = @import("ziglings.zig");

const Diagnostic = @import("Diagnostics.zig");

const Self = @This();

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
    status_code: i16,

    handle: *c.CURL,
};

pub const Info = struct {
    pub const active_socket = c.CURLINFO_ACTIVESOCKET;
    pub const private = c.CURLINFO_PRIVATE;
};

/// NOTE: info will definitely be important later but don't do it know since it would probably take a while
pub inline fn setInfo() !void {}

/// initiate easy interface
pub inline fn init() !Self {
    return Self{
        .handle = c.curl_easy_init() orelse return error.CurlInit,
        .diagnostic = .{},
    };
}

pub inline fn deinit(self: *Self) void {
    c.curl_easy_cleanup(self.handle);
}

pub inline fn setUrl(self: *Self, url: [:0]const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_URL, url.ptr));
}

pub inline fn setMethod(self: *Self, method: Method) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_CUSTOMREQUEST, method.toString()));
}

pub inline fn setPostField(self: *Self, body: []const u8) !void {
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDS, body.ptr));
    try self.diagnostic.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_POSTFIELDSIZE, body.len));
}

pub inline fn dupHandle(self: *Self) !*c.CURL {
    return c.curl_easy_duphandle(self.handle) orelse error.CurlInit;
}

pub fn perform(self: *Self) !Response {
    try self.setCommonOptions();
    try self.diagnostic.checkError(c.curl_easy_perform(self.handle));

    const status_code: c_long = 0;
    try self.diagnostic.checkError(c.curl_easy_getinfo(self.handle, c.CURLINFO_RESPONSE_CODE, &status_code));
    return Response{
        .handle = self.handle,
        .status_code = status_code,
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
