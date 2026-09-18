const std = @import("std");
const curl = @import("curl.zig");

const bridge = @import("bridge.zig");

const Self = @This();

ptr: *curl.CURLM,

pub fn init() !Self {
    return Self{
        .ptr = curl.curl_multi_init() orelse return bridge.CurlE.CurlError.FailedInit,
    };
}
