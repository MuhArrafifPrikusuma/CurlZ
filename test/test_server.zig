const std = @import("std");

pub const MockServerState = enum(u8) {
    idle,
    running,
    done,
};

pub var server_runner_sync = std.atomic.Value(MockServerState).init(.idle);
pub var server_ready = std.atomic.Value(bool).init(false);
pub var server_url: [:0]const u8 = undefined;

pub fn ensureRunning() !void {
    const state = server_runner_sync.load(.acquire);
    const io = std.testing.io;

    if (state == .idle) {
        _ = try std.Thread.spawn(.{}, run, .{});
        _ = server_runner_sync.swap(.running, .acq_rel);
    }

    while (!server_ready.load(.acquire)) {
        try std.Io.sleep(io, .fromMilliseconds(1), .real);
    }
}

fn formatUrl(url: []const u8, port: u16) ![:0]const u8 {
    var buf: [4096]u8 = undefined;
    return try std.mem.printSentinel(&buf, "{s}:{d}", .{ url, port }, 0);
}

/// return IpAddress to connect to by the client
fn run() !void {
    const io = std.testing.io;
    const url: []const u8 = "127.0.0.1";
    const addr = try std.Io.net.IpAddress.parse(url, 0);

    var server = try addr.listen(io, .{ .reuse_address = true });
    defer server.deinit(io);

    const full_url = try formatUrl(url, server.socket.address.getPort());
    server_url = try std.heap.smp_allocator.dupeSentinel(u8, full_url, 0);

    _ = server_ready.swap(true, .acq_rel);
    while (server_runner_sync.load(.acquire) == .running) {
        var conn = try server.accept(io);
        try handleConnection(&conn, io);
    }
}

fn handleConnection(conn: *std.Io.net.Stream, io: std.Io) !void {
    defer conn.close(io);

    var bufin: [8192]u8 = undefined;
    var bufout: [8192]u8 = undefined;

    var stdin = conn.reader(io, &bufin);
    const reader = &stdin.interface;

    var stdout = conn.writer(io, &bufout);
    const writer = &stdout.interface;

    var http = std.http.Server.init(reader, writer);
    var request = try http.receiveHead();

    try request.respond("", .{
        .status = .ok,
    });
}
