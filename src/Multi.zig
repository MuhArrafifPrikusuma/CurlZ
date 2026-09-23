const std = @import("std");
const c = @import("c");
const ziglings = @import("ziglings.zig");
const curlz = @import("root.zig");

const Easy = @import("Easy.zig");
const Diagnostic = @import("Diagnostics.zig");

const Self = @This();

const Socket = c_int;

const WaitEvents = packed struct(@Int(.signed, @bitSizeOf(c_short))) {
    pollin: bool = false,
    pollout: bool = false,
    pollpri: bool = false,
    __padding__: @Int(.signed, (@bitSizeOf(c_short) - 3)) = 0,
};

pub const WaitFd = struct {
    fd: Socket,
    events: WaitEvents,
    revents: WaitEvents,

    pub fn getPtr(self: *WaitFd) *c.curl_waitfd {
        return @ptrCast(self);
    }
};

pub const Info = struct {
    msg_in_queue: u32,
    msg: *curlz.CurlMsg,
};

mhandle: *c.CURLM,
diagnostic: Diagnostic,

pub fn init() !Self {
    return Self{
        .mhandle = c.curl_multi_init() orelse return error.CurlMinit,
        .diagnostic = .{},
    };
}

pub inline fn deinit(self: *Self) void {
    std.debug.assert(self.diagnostic.checkMError(c.curl_multi_cleanup(self.mhandle)) != error.Curlm);
    self.diagnostic.checkMError(c.curl_multi_cleanup(self.mhandle)) catch {};
}

pub inline fn wakeup(self: *Self) !void {
    try self.diagnostic.checkMError(c.curl_multi_wakeup(self.mhandle));
}

pub inline fn perform(self: *Self, running_handles: *c_int) !void {
    try self.diagnostic.checkMError(c.curl_multi_perform(self.mhandle, running_handles));
}

pub inline fn removeHandle(self: *Self, easy: *Easy) !void {
    try self.diagnostic.checkMError(c.curl_multi_remove_handle(self.mhandle, easy.handle));
}

pub inline fn addHandle(self: *Self, easy: *Easy) !void {
    try easy.setCommonOptions();
    try self.diagnostic.checkMError(c.curl_multi_add_handle(self.mhandle, easy.handle));
}

/// read info from easy handler and return Info, easy_handle from Info.msg.easy_handle can be wrapped
/// using Easy.wrap
pub fn readInfo(self: *Self) !Info {
    var msg_in_queue: u32 = 0;
    const msgData: ?*c.struct_CURLMsg = c.curl_multi_info_read(self.mhandle, @ptrCast(&msg_in_queue));

    if (msgData == null) {
        return error.FailedtoReadInfo;
    }

    return Info{
        .msg_in_queue = msg_in_queue,
        .msg = msgData.?,
    };
}

pub fn poll(self: *Self, extra_fds: ?[]WaitFd, timeout_ms: u32) !u32 {
    var numfds: c_int = 0;
    var fds: ?[*]c.curl_waitfd = null;
    var fds_len: c_int = 0;

    if (extra_fds) |v| {
        fds = @ptrCast(v.ptr);
        fds_len = @intCast(v.len);
    }

    try self.diagnostic.checkMError(c.curl_multi_poll(
        self.handle,
        fds,
        fds_len,
        @as(c_int, @intCast(timeout_ms)),
        &numfds,
    ));
    return @intCast(numfds);
}
