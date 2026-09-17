const std = @import("std");
const curl = @import("curl.zig");
const Type = @import("type.zig");

const Self = @This();

const EasyError = error{
    initFailed,
};
/// pointer to curl easy
ptr: *curl.CURL,

/// initiate easy interface
pub fn init() !Self {
    return Self{
        .ptr = curl.curl_easy_init() orelse EasyError.initFailed,
    };
}

pub fn cleanup(self: *Self) void {
    curl.curl_easy_cleanup(self.ptr);
}

pub fn setopt(self: *Self, comptime option: Type.CurlOpt, args: anytype) !void {
    curl.curl_easy_setopt(
        self.ptr,
        @as(c_uint, @intFromEnum(option)),
    );
}
