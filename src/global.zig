const std = @import("std");
const c = @import("c");

const Diagnostics = @import("Diagnostics.zig");

const Self = @This();

pub var diagnostic: Diagnostics = .{};

const Flags = enum(c_int) {
    all = c.CURL_GLOBAL_ALL,
    winsock = c.CURL_GLOBAL_WIN32,
    nothing = c.CURL_GLOBAL_NOTHING,
};

pub inline fn init(flags: Flags) !void {
    try diagnostic.checkError(c.curl_global_init(@intFromEnum(flags)));
}

pub inline fn cleanup() void {
    c.curl_global_cleanup();
}
