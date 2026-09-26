const std = @import("std");
const root = @import("root");
const c = @import("c");

pub const Socket = c_int;

pub const Easy = @import("Easy.zig");
pub const Multi = @import("Multi.zig");
pub const global = @import("global.zig");

pub const CurlMsg = c.struct_CURLMsg;
pub const InfoType = c.curl_infotype;

pub const Headers = struct {
    headers: ?*c.curl_slist = null,

    pub fn deinit(self: Headers) void {
        if (self.headers) |h| {
            c.curl_slist_free_all(h);
        }
    }

    pub fn add(self: *Headers, header: [:0]const u8) !void {
        self.headers = c.curl_slist_append(self.headers, header.ptr) orelse return error.Curl_slist_append;
    }
};
