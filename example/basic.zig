//! example of doing simple http request using easy interface
const std = @import("std");
const curl = @import("curl");
const testing = @import("testing");

pub fn main(init: std.process.Init) !void {
    // run mock server to connect to
    try testing.server.ensureRunning(init.io);

    try curl.global.init(.all);
    defer curl.global.deinit();

    var bufio: [4096]u8 = undefined;
    var writer = std.Io.File.stdout().writer(init.io, &bufio);
    const stdout = &writer.interface;

    var easy = try curl.Easy.init(.{});
    defer easy.deinit();

    // activate libcurl debug mode
    try easy.setVerbose(true);

    try easy.setMethod(.GET);
    try easy.setUrl(testing.server.server_url);

    const find_header: [:0]const u8 = "Content-Type";

    const res = try easy.perform();
    const accept = try res.getHeader(find_header);
    if (accept) |v| {
        try stdout.print("\nheader: {s}\nvalue: {s}\n", .{ v.name, v.getValue() });
    } else {
        try stdout.print("\nCouldn't find header '{s}'\n", .{find_header});
    }
    try stdout.flush();
}
