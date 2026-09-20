const std = @import("std");
const curl = @import("curl.zig");
const bridge = @import("bridge.zig");
const ziglings = @import("ziglings.zig");

const Self = @This();

const EasyError = error{
    initFailed,
};
/// pointer to curl easy
ptr: *curl.CURL,

/// initiate easy interface
pub inline fn init() !Self {
    return Self{
        .ptr = curl.curl_easy_init() orelse return EasyError.initFailed,
    };
}

pub inline fn cleanup(self: *Self) void {
    curl.curl_easy_cleanup(self.ptr);
}

pub fn setopt(self: *Self, comptime option: bridge.CurlOpt, arg: anytype) bridge.CurlE.CurlError!void {
    if (@typeInfo(@TypeOf(arg)) == .@"struct") @compileError("use anyopaque pointer to heap for struct");

    const translate_arg = comptime getArg: {
        if (ziglings.isPrimitive(@typeInfo(@TypeOf(arg)))) {
            break :getArg ziglings.PrimitiveCoercion(arg);
        } else @compileError("not supported for now");
    };

    const code = curl.curl_easy_setopt(
        self.ptr,
        @as(c_uint, @intFromEnum(option)),
        translate_arg,
    );
    return bridge.CurlE.errorFromEnum(@enumFromInt(code));
}

pub inline fn perform(self: *Self) !void {
    curl.curl_easy_perform(self.ptr);
}
