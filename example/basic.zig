//! example of doing simple http request using easy interface
const std = @import("std");
const curl = @import("curl");
const mockServer = @import("mockServer");

// fn writeCallback(ptr: [*:0]const u8, size: usize, nmemb: usize, userdata: ?*anyopaque) callconv(.c) usize {}

pub fn main(init: std.process.Init) !void {
    try mockServer.ensureRunning(init.io);

    try curl.global.init(.all);
    defer curl.global.deinit();

    var gpa = std.heap.DebugAllocator(.{}).init;
    defer if (gpa.deinit() != .ok) @panic("leak");

    var easy = try curl.Easy.init(.{});
    defer easy.deinit();

    // activate libcurl debug mode
    try easy.setVerbose(true);

    var headers: curl.Headers = .{};
    defer headers.deinit();

    try headers.add("Accept: text/plain");

    try easy.setMethod(.GET);
    try easy.setUrl(mockServer.server_url);

    _ = try easy.perform();
}
