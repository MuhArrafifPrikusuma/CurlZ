const std = @import("std");
const root = @import("root");
const c = @import("c");

pub const Socket = c_int;

pub const Easy = @import("Easy.zig");
pub const Multi = @import("Multi.zig");
pub const global = @import("global.zig");

pub const CurlMsg = c.struct_CURLMsg;
