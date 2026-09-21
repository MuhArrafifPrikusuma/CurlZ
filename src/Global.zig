const std = @import("std");
const c = @import("curl.zig");

const Diagnostics = @import("Diagnostics.zig");

const Self = @This();

const Flags = enum(c_int) {
    all = c.CURL_GLOBAL_ALL,
    winsock = c.CURL_GLOBAL_WIN32,
    nothing = c.CURL_GLOBAL_NOTHING,
    default = c.CURL_GLOBAL_DEFAULT,
};

diagnostics: Diagnostics,

pub inline fn init(self: *Self, flags: Flags) !void {
    try self.diagnostics.checkError(c.curl_global_init(flags));
}

pub inline fn cleanup() void {
    c.curl_global_cleanup();
}
