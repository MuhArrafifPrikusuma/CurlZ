const std = @import("std");
const root = @import("root");
const c = @import("c");

pub const Easy = @import("Easy.zig");
pub const Multi = @import("Multi.zig");
pub const Diagnostic = @import("Diagnostics.zig");
pub const global = @import("global.zig");

pub const CurlMsg = c.struct_CURLMsg;
pub const InfoType = c.curl_infotype;
pub const Curl = c.CURL;
pub const CurlM = c.CURLM;
pub const Socket = c.curl_socket_t;

const util = @import("util.zig");

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

pub inline fn free(ptr: *anyopaque) void {
    c.curl_free(ptr);
}

test "test all" {
    std.testing.refAllDecls(@This());
}
