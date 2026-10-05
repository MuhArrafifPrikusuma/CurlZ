const std = @import("std");
const builtin = @import("builtin");
const c = @import("c");
const testing = @import("testing");

const util = @import("util.zig");
const ziglings = @import("ziglings.zig");
const http = @import("http.zig");

const Easy = @import("Easy.zig");
const Diagnostic = @import("Diagnostics.zig");

const Msg = @import("root.zig").Msg;
const CurlM = @import("root.zig").CurlM;
const Curl = @import("root.zig").Curl;
const Socket = @import("root.zig").Socket;
const HandleOrWrapper = Easy.HandleOrWrapper;

const Self = @This();

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
    msg: *Msg,
};

pub const Notification = enum(c_uint) {
    info_read = c.CURLMNOTIFY_INFO_READ,
    easy_done = c.CURLMNOTIFY_EASY_DONE,
};

pub const Callback = enum(c_int) {
    notify = c.CURLMOPT_NOTIFYFUNCTION,
    socket = c.CURLMOPT_SOCKETFUNCTION,
    timer = c.CURLMOPT_TIMERFUNCTION,

    pub fn signature(self: Callback) struct {
        callback_fn: type,
        data: c_int,
    } {
        return switch (self) {
            .notify => .{
                .callback_fn = *const fn (*CurlM, c_uint, *Curl, *anyopaque) callconv(.c) void,
                .data = c.CURLMOPT_NOTIFYDATA,
            },
            .socket => .{
                .callback_fn = *const fn (*Curl, Socket, c_int, *anyopaque, *anyopaque) c_int,
                .data = c.CURLMOPT_SOCKETDATA,
            },
            .timer => .{
                .callback_fn = *const fn (*CurlM, c_long, *anyopaque) callconv(.c) c_int,
                .data = c.CURLMOPT_TIMERDATA,
            },
        };
    }
};

mhandle: *CurlM,
diagnostic: Diagnostic,

pub fn init() !Self {
    return Self{
        .mhandle = c.curl_multi_init() orelse return error.CurlMinit,
        .diagnostic = .{},
    };
}

pub inline fn deinit(self: *Self) void {
    if (builtin.mode == .debug or builtin.mode == .safe)
        std.debug.assert(self.diagnostic.checkMError(c.curl_multi_cleanup(self.mhandle)) != error.Curlm);
    if (builtin.mode == .fast or builtin.mode == .small)
        self.diagnostic.checkMError(c.curl_multi_cleanup(self.mhandle)) catch unreachable;
}

pub inline fn wakeup(self: *Self) !void {
    try self.diagnostic.checkMError(c.curl_multi_wakeup(self.mhandle));
}

pub inline fn assign(self: *Self, sockfd: c.curl_socket_t, sockptr: *anyopaque) !void {
    try self.diagnostic.checkMError(c.curl_multi_assign(self.mhandle, sockfd, sockptr));
}

/// return number of running handles that are still running
pub inline fn perform(self: *Self) !usize {
    var running_handles: c_int = 0;
    try self.diagnostic.checkMError(c.curl_multi_perform(self.mhandle, &running_handles));
    return @intCast(running_handles);
}

pub inline fn setMaxTotalConnections(self: *Self, amount: usize) !void {
    try self.diagnostic.checkMError(c.curl_multi_setopt(self.mhandle, c.CURLMOPT_MAX_TOTAL_CONNECTIONS, @as(c_long, @intCast(amount))));
}

/// set max number of connections to a single host
pub inline fn setMaxHostConnections(self: *Self, max: usize) !void {
    try self.diagnostic.checkMError(c.curl_multi_setopt(self.mhandle, c.CURLMOPT_MAX_HOST_CONNECTIONS, @as(c_long, @intCast(max))));
}

pub inline fn setMaxCacheGrow(self: *Self, max: usize) !void {
    try self.diagnostic.checkMError(c.curl_multi_setopt(self.mhandle, c.CURLMOPT_MAXCONNECTS, @as(c_long, @intCast(max))));
}

pub inline fn notifyDisable(self: *Self, notification: Notification) !void {
    comptime util.expectMultiNotifySupport(@src());
    try self.diagnostic.checkMError(c.curl_multi_notify_disable(self.mhandle, @intFromEnum(notification)));
}

pub inline fn notifyEnable(self: *Self, notification: Notification) !void {
    comptime util.expectMultiNotifySupport(@src());
    try self.diagnostic.checkMError(c.curl_multi_notify_enable(self.mhandle, @intFromEnum(notification)));
}

/// get all easy handles
pub inline fn getHandles(self: *Self) ?[]const *Curl {
    return std.mem.span(c.curl_multi_get_handles(self.mhandle));
}

pub inline fn setCallback(
    self: *Self,
    comptime cb: Callback,
    func: cb.signature().callback_fn,
    data: *anyopaque,
) !void {
    try self.diagnostic.checkMError(c.curl_multi_setopt(self.mhandle, @intFromEnum(cb), func));
    try self.diagnostic.checkMError(c.curl_multi_setopt(self.mhandle, cb.signature().data, data));
}

pub inline fn addHandle(self: *Self, easy: *Easy) !void {
    try easy.setCommonOpt();
    try self.diagnostic.checkMError(c.curl_multi_add_handle(self.mhandle, easy.handle));
}

pub fn removeHandle(self: *Self, easy: HandleOrWrapper) !void {
    const handle = switch (easy) {
        .handle => |hndle| hndle,
        .wrapper => |wrapr| wrapr.handle,
    };
    try self.diagnostic.checkMError(c.curl_multi_remove_handle(self.mhandle, handle));
}

pub fn wrap(mhandle: *CurlM) Self {
    return .{
        .diagnostic = .{},
        .mhandle = mhandle,
    };
}

/// read info from easy handler and return Info, easy_handle from Info.msg.easy_handle can be wrapped
/// using Easy.wrap
pub fn readInfo(self: *Self) ?Info {
    var msg_in_queue: u32 = 0;
    const msgData: ?*Msg = @ptrCast(c.curl_multi_info_read(self.mhandle, @as(*c_int, @ptrCast(&msg_in_queue))));

    if (msgData) |data| {
        return Info{
            .msg_in_queue = msg_in_queue,
            .msg = data,
        };
    } else return null;
}

/// return the number of file descriptors polled
pub fn poll(self: *Self, extra_fds: ?[]WaitFd, timeout_ms: u32) !u32 {
    var numfds: c_int = 0;
    var fds: ?[*]c.curl_waitfd = null;
    var fds_len: c_uint = 0;

    if (extra_fds) |v| {
        fds = @ptrCast(v.ptr);
        fds_len = @intCast(v.len);
    }

    try self.diagnostic.checkMError(c.curl_multi_poll(
        self.mhandle,
        fds,
        fds_len,
        @as(c_int, @intCast(timeout_ms)),
        &numfds,
    ));
    return @intCast(numfds);
}

test "poll" {
    try testing.server.ensureRunning({});
    try testing.ensureFunctionHasRun(@import("root.zig").global.init, .{.all});

    var multi = try Self.init();
    defer multi.deinit();

    const max_easy: usize = 1000;
    var i: usize = 0;
    while (i < max_easy) : (i += 1) {
        var easy = try Easy.init(.{});
        try easy.setUrl(testing.server.server_url);
        try easy.setMethod(.GET);

        multi.addHandle(&easy) catch |err| {
            std.testing.failPrint("error addHandle: {?s}\n", .{multi.diagnostic.getMessage()});
            return err;
        };
    }

    while (true) {
        const running_handles = multi.perform() catch |err| {
            std.testing.failPrint("error perform: {?s}\n", .{multi.diagnostic.getMessage()});
            return err;
        };

        while (multi.readInfo()) |info| {
            if (info.msg.easy_handle) |handle| {
                try multi.removeHandle(.{ .handle = handle });

                var easy = Easy.wrap(handle, .{});
                defer easy.deinit();

                const status_code: http.Status = try easy.getInfo(.response_code);
                try std.testing.expect(status_code == .ok);
            }
        }

        if (running_handles <= 0) break;
        _ = multi.poll(null, 10) catch |err| {
            std.testing.failPrint("{?s}\n", .{multi.diagnostic.getMessage()});
            return err;
        };
    }
}
