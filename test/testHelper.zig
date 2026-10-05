const std = @import("std");
const builtin = @import("builtin");

pub const server = @import("test_server.zig");

const State = enum(u8) {
    never_ran,
    done_running,
};

var function_state = std.atomic.Value(State).init(.never_ran);
var function_done: bool = false;

/// use this to ran global initialization function that is not thread safe and should only run once.
/// [`IMPORTANT!` this function can only run inside test environtment]
/// NOTE: right now this can only has run one function at a time and using multiple different function
/// will simply just ran the very first one that ran
pub fn ensureFunctionHasRun(comptime func: anytype, args: anytype) compute: {
    if (@typeInfo(@TypeOf(func)) == .@"fn") {
        if (@typeInfo(@TypeOf(func)).@"fn".return_type) |return_type| {
            if (@typeInfo(return_type) == .error_union) {
                break :compute anyerror!@typeInfo(return_type).error_union.payload;
            }
        } else break :compute void;
    } else {
        @compileError("expected function type found: " ++ @typeName(@TypeOf(func)));
    }
} {
    const ArgType = @TypeOf(args);
    const arg_info = @typeInfo(ArgType);

    if (arg_info != .@"struct")
        @compileError("expected struct found: " ++ @typeName(ArgType));

    if (function_state.cmpxchgStrong(.never_ran, .done_running, .acq_rel, .monotonic)) |_| {} else {
        if (@typeInfo(@TypeOf(func)).@"fn".return_type) |return_type| {
            if (@typeInfo(return_type) == .error_union) {
                return try @call(.auto, func, args);
            } else {
                return @call(.auto, func, args);
            }
        } else {
            return @call(.auto, func, args);
        }
        function_done = true;
    }

    const io = std.testing.io;
    if (!function_done) {
        if (function_state.load(.acquire) == .never_ran) return error.FailedToRunFunction;
        try std.Io.sleep(io, .fromMilliseconds(1), .real);
    }
}
