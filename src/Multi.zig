const std = @import("std");
const c = @import("c");

const Self = @This();

ptr: *c.CURLM,

pub fn init() !Self {
    return Self{
        .ptr = c.curl_multi_init() orelse return error.CurlMinit,
    };
}
