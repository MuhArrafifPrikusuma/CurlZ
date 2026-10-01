const std = @import("std");
const c = @import("curl.zig");
const builtin = @import("builtin");

const HttpVersions = @import("Easy.zig").HttpVersions;

comptime {
    if (!@hasDecl(c, "CURL_AT_LEAST_VERSION"))
        @compileError("Failed to check libcurl version, libcurl version must at least: 7.43.0");
}

pub fn expectHeaderSupport(comptime src: std.builtin.SourceLocation) void {
    if (c.CURL_AT_LEAST_VERSION(7, 84, 0)) return;

    @compileError(std.fmt.comptimePrint(
        "libcurl version: \x1b[2m{s}\x1b[0m does not support function: \x1b[2m{s}\x1b[0m\n",
        .{
            c.LIBCURL_VERSION,
            src.fn_name,
        },
    ));
}

pub fn hasHeaderSupport() bool {
    return c.CURL_AT_LEAST_VERSION(7, 84, 0);
}

pub fn expectMultiNotifySupport(comptime src: std.builtin.SourceLocation) void {
    if (c.CURL_AT_LEAST_VERSION(8, 17, 0)) return;

    @compileError(std.fmt.comptimePrint(
        "libcurl version: \x1b[2m{s}\x1b[0m does not support function: \x1b[2m{s}\x1b[0m\n",
        .{
            c.LIBCURL_VERSION,
            src.fn_name,
        },
    ));
}

pub fn hasNewFollowMode() bool {
    return c.CURL_AT_LEAST_VERSION(8, 13, 0);
}

pub fn assertRuntimePanic(comptime fmt: []const u8, args: anytype, ok: bool) void {
    switch (builtin.mode) {
        .debug, .safe => {
            if (!ok) std.debug.panic(fmt, args);
        },
        else => return,
    }
}

pub fn hasHttpVersionSupport(ver: HttpVersions) void {
    if (builtin.mode == .debug or builtin.mode == .safe) {
        const @"panic?" = switch (ver) {
            .@"3Only" => c.CURL_AT_LEAST_VERSION(7, 88, 0),
            .@"3" => c.CURL_AT_LEAST_VERSION(7, 66, 0),
            .@"2_prior_knowledge" => c.CURL_AT_LEAST_VERSION(8, 10, 0),
            else => return,
        };
        assertRuntimePanic(
            "libcurl version \x1b[2m'{s}'\x1b[0m does not support http version \x1b[2m'{s}'\x1b[0m",
            .{c.LIBCURL_VERSION},
            @"panic?",
        );
    } else return;
}
