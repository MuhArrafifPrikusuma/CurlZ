const std = @import("std");
const c = @import("c");

comptime {
    if (!@hasDecl(c, "CURL_AT_LEAST_VERSION"))
        @compileError("Failed to check libcurl version, libcurl version must at least: 7.43.0");
}

pub fn hasHeaderSupport() bool {
    return c.CURL_AT_LEAST_VERSION(7, 84, 0);
}
