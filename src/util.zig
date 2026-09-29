const std = @import("std");
const c = @import("c");

comptime {
    if (!@hasDecl(c, "CURL_AT_LEAST_VERSION"))
        @compileError("Failed to check libcurl version, libcurl version must at least: 7.43.0");
}

pub fn hasHeaderSupport(comptime src: std.builtin.SourceLocation) void {
    if (c.CURL_AT_LEAST_VERSION(7, 84, 0)) return;

    @compileError(std.fmt.comptimePrint(
        "libcurl version: \x1b[2m{s}\x1b[0m does not support function: \x1b[2m{s}\x1b[0m\n",
        .{
            c.LIBCURL_VERSION,
            src.fn_name,
        },
    ));
}
