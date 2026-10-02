const std = @import("std");
const c = @import("c");

const Easy = @import("Easy.zig");
const Diagnostic = @import("Diagnostics.zig");

const Mime = @import("root.zig").Mime;
const Curl = @import("root.zig").Curl;
const HandleOrWrapper = @import("Multi.zig").HandleOrWrapper;

const Self = @This();

mime_handle: *Mime,
diagnostic: Diagnostic,

pub fn init(easy: HandleOrWrapper, diagnostic: *Diagnostic) !Self {
    const handle = switch (easy) {
        .handle => |hndl| hndl,
        .wrapper => |wrpr| wrpr.handle,
    };
    const mime_handle = c.curl_mime_init(handle) orelse return error.MimeInit;
    return .{
        .diagnostic = diagnostic,
        .mime_handle = mime_handle,
    };
}

pub inline fn deinit(self: *Self) void {
    c.curl_mime_free(self.mime_handle);
}
