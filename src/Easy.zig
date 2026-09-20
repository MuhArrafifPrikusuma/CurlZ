const std = @import("std");
const c = @import("c");
const ziglings = @import("ziglings.zig");

const Diagnostics = @import("Diagnostics.zig");

const Self = @This();

const EasyError = error{
    initFailed,
};
/// pointer to curl easy
handle: *c.CURL,
diagnostics: Diagnostics,

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

/// initiate easy interface
pub inline fn init() !Self {
    return Self{
        .handle = c.curl_easy_init() orelse return error.CurlInit,
        .diagnostics = .{},
    };
}

pub inline fn cleanup(self: *Self) void {
    c.curl_easy_cleanup(self.handle);
}

pub inline fn perform(self: *Self) !void {
    try self.diagnostics.checkError(c.curl_easy_perform(self.handle));
}

pub inline fn setUrl(self: *Self, url: [:0]const u8) !void {
    try self.diagnostics.checkError(c.curl_easy_setopt(self.handle, c.CURLOPT_URL, url.ptr));
}
