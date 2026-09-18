const std = @import("std");

pub fn isPrimitive(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .void, .type, .noreturn => @compileError("Cannot coerce Type" ++ @typeName(T)),
        .int, .float, .comptime_float, .comptime_int => true,
        else => false,
    };
}

/// check for integer coercion
fn IntegerCoercion(info: std.builtin.Type.Int) type {
    if (info.bits > 64) @compileError("Cannot coerce integer bits larger 64 bits");

    return switch (info.bits) {
        8 => if (info.signedness == .signed) @compileError("does not support 8 bits right now"),
        16 => if (info.signedness == .signed) c_int else c_uint,
        32 => if (info.signedness == .signed) c_long else c_ulong,
        64 => if (info.signedness == .signed) c_longlong else c_ulonglong,
        else => @compileError("does not support integer with bits" ++ info.bits),
    };
}

fn PrimitiveCoercionChecker(T: type) type {
    const type_info = @typeInfo(T);

    return switch (type_info) {
        .int => |t_int| IntegerCoercion(t_int),
        // float only support double
        .float => c_longdouble,
    };
}

fn PointerCoercionChecker(comptime ptr: std.builtin.Type.Pointer) type {
    if (ptr.size != .c) @compileError("already zig pointer");
    return switch (ptr.size) {
        // .one => @Pointer(
        //     .c,
        //     .{
        //         .@"addrspace" = pointer_t.attrs.@"addrspace",
        //         .@"align" = pointer_t.attrs.@"align",
        //         .@"allowzero" = true,
        //         .@"const" = pointer_t.attrs.@"const",
        //         .@"volatile" = pointer_t.attrs.@"volatile",
        //     },
        //     pointer_t.child,
        //     null,
        // ),
        // else => @compileError("add later"),
    };
}

pub fn primitiveCoercion(arg: anytype) PrimitiveCoercionChecker(@TypeOf(arg)) {
    const ArgType = @TypeOf(arg);
    const arg_type_info = @typeInfo(ArgType);

    if (comptime isPrimitive(arg_type_info)) {
        switch (arg_type_info) {
            .int, .comptime_int => return @as(PrimitiveCoercionChecker(ArgType), @intCast(arg)),
            .float, .comptime_float => return @as(c_longdouble, @floatCast(arg)),
        }
    } else @compileError("cannot use primitiveCoercion on non primitive type");
}

/// only used for single item pointer
pub fn cPtrToZigSingleItemPtr() !void {}
