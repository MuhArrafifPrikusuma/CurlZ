const std = @import("std");
const c = @import("curl.zig");

const Easy = @import("Easy.zig");
const Diagnostic = @import("Diagnostics.zig");

const Self = @This();

const Socket = u32;
const WaitEvents = packed struct(u8) {
    pollin: bool = false,
    pollout: bool = false,
    pollpri: bool = false,
    __padding__: u5 = 0,
};

pub const WaitFd = struct {
    fd: Socket,
    events: WaitEvents,
    revents: WaitEvents,

    pub fn translate(self: WaitFd) !c.curl_waitfd {
        return c.curl_waitfd{
            .fd = @intCast(self.fd),
            .events = @as(c_short, @bitCast(self.events)),
            .revents = @as(c_short, @bitCast(self.revents)),
        };
    }
};

handle: *c.CURLM,
diagnostic: Diagnostic,

pub fn init() !Self {
    return Self{
        .handle = c.curl_multi_init() orelse return error.CurlMinit,
        .diagnostic = .{},
    };
}

pub inline fn deinit(self: *Self) !void {
    try self.diagnostic.checkMError(c.curl_multi_cleanup(self.handle));
}

pub inline fn wakeup(self: *Self) !void {
    try self.diagnostic.checkMError(c.curl_multi_wakeup(self.handle));
}

// pub inline fn poll(self: *Self) !void {
// c.curl_multi_poll(self.handle, )
// }

pub inline fn addHandle(self: *Self, handle: *Easy) !void {
    try self.diagnostic.checkMError(c.curl_multi_add_handle(self.handle, handle.handle));
}
