const std = @import("std");
const builtin = @import("builtin");

pub const server = @import("test_server.zig");

pub const State = enum(u8) {
    not_started,
    in_progress,
    started,
};

fn OnceUnion(comptime func: anytype) type {
    return union(enum) {
        payload: GetReturnType(func),
        once_set: anyerror!void,
    };
}

var function_state = std.atomic.Value(State).init(.not_started);

/// use this to run global initialization function that is not thread safe and should only run once.
/// [`IMPORTANT!` this function can only run inside test environtment.
/// NOTE: right now this can only has run one function at a time and using multiple different function
/// will simply just ran the very first one that ran
pub fn ensureFunctionHasRun(comptime func: anytype, args: anytype) OnceUnion(func) {
    const ArgType = @TypeOf(args);
    const arg_info = @typeInfo(ArgType);

    if (arg_info != .@"struct")
        @compileError("expected struct found: " ++ @typeName(ArgType));

    if (function_state.cmpxchgStrong(.not_started, .in_progress, .acq_rel, .monotonic) == null) {
        errdefer function_state.store(.not_started, .release);

        const capture = @call(.auto, func, args);
        function_state.store(.started, .release);
        return .{ .payload = capture };
    }

    const io = std.testing.io;
    while (function_state.load(.acquire) == .in_progress) {
        std.Io.sleep(io, .fromMicroseconds(10), .real) catch |err| {
            return .{ .once_set = err };
        };
    }
    if (function_state.load(.acquire) == .not_started) return .{ .once_set = error.UnableToRunFunction };
    return .{ .once_set = {} };
}

fn GetReturnType(comptime func: anytype) type {
    const fn_info = switch (@typeInfo(@TypeOf(func))) {
        .@"fn" => |info| info,
        .pointer => |ptr| switch (@typeInfo(ptr.child)) {
            .@"fn" => |info| info,
            else => @compileError("Expected function pointer, found pointer to: " ++ @typeName(ptr.child)),
        },
        else => @compileError("Expected function type or function pointer type, found: " ++ @typeName(func)),
    };
    const return_type = fn_info.return_type orelse return void;
    if (@typeInfo(return_type) == .error_union) {
        return anyerror!@typeInfo(return_type).error_union.payload;
    }
    return return_type;
}
