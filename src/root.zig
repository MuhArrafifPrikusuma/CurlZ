const std = @import("std");
const root = @import("root");
const c = @import("c");

pub const global = @import("global.zig");
pub const http = @import("http.zig");

pub const Easy = @import("Easy.zig");
pub const Multi = @import("Multi.zig");
pub const MultiPart = @import("MultiPart.zig");
pub const Diagnostic = @import("Diagnostics.zig");

pub const Msg = c.struct_CURLMsg;
pub const InfoType = c.curl_infotype;
pub const Curl = c.CURL;
pub const CurlM = c.CURLM;
pub const Socket = c.curl_socket_t;
pub const Mime = c.curl_mime;

/// this is just standard library std.http.Status but with c_long as it's backing integer
/// to satisfy libcurl allignment
const util = @import("util.zig");

pub const Headers = struct {
    list: ?*c.curl_slist = null,

    pub fn deinit(self: Headers) void {
        if (self.list) |h| {
            c.curl_slist_free_all(h);
        }
    }

    pub fn add(self: *Headers, header: [:0]const u8) !void {
        self.list = c.curl_slist_append(self.list, header.ptr) orelse return error.Curl_slist_append;
    }
};

pub inline fn free(ptr: *anyopaque) void {
    c.curl_free(ptr);
}

test "test_all" {
    std.testing.refAllDecls(@This());
}
