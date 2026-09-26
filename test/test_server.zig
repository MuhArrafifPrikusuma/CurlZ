const std = @import("std");

pub fn main(init: std.process.Init) !void {
    try run(init.io);
}

/// return IpAddress to connect to by the client
pub fn run(io: std.Io) !void {
    const addr = try std.Io.net.IpAddress.parse("127.0.0.1", 8080);

    var server = try addr.listen(io, .{ .reuse_address = true });
    defer server.deinit(io);

    std.debug.print("running on: {s}{d}\n", .{ addr.ip4.bytes, addr.getPort() });
    while (true) {
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
