const std = @import("std");
const curl = @import("curl");
const mockServer = @import("mockServer");

pub fn write_callback(ptr: [*:0]const u8, size: usize, nmemb: usize, userdata: ?*anyopaque) callconv(.c) usize {
    _ = ptr;
    _ = size;
    _ = userdata;
    return nmemb;
}

pub fn main(init: std.process.Init) !void {
    try mockServer.ensureRunning(init.io);
    try curl.global.init(.all);
    defer curl.global.deinit();

    var multi = try curl.Multi.init();
    defer multi.deinit();

    const max: usize = 1000;
    var i: usize = 0;
    while (i < max) : (i += 1) {
        var easy = try curl.Easy.init(.{});
        try easy.setUrl(mockServer.server_url);
        try easy.setMethod(.GET);
        // use all supported encodings
        try easy.setEncoding("");

        multi.addHandle(&easy) catch {
            std.debug.panic("{?s}\n", .{multi.diagnostic.getMessage()});
        };
    }

    const progress = std.Progress.start(init.io, .{ .root_name = "progress", .estimated_total_items = max });

    while (true) {
        const running = try multi.perform();

        while (multi.readInfo()) |info| {
            if (info.msg.easy_handle) |handle| {
                try multi.removeHandle(.{ .handle = handle });

                var wrap = curl.Easy.wrap(handle, .{});
                defer wrap.deinit();
                progress.completeOne();
            }
        }
        if (running <= 0) break;
        _ = try multi.poll(null, 10);
    }
    progress.end();
}
