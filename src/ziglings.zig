//! ziglings contain helper for library functions, for user helper functions check help.zig
const std = @import("std");
const builtin = @import("builtin");

fn isPrimitive(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .optional => |optional_info| isPrimitive(optional_info.child),
        .void, .type, .noreturn => @compileError("Cannot coerce Type" ++ @typeName(T)),
        .int, .float, .comptime_float, .comptime_int => true,
        else => @compileError("this is called"),
    };
}

fn isPtr(T: type) bool {
    if (@typeInfo(T) == .optional) {
        if (@typeInfo(T)) |optional_info| {
            return optional_info.child == .pointer;
        }
    }
    return @typeInfo(T) == .pointer;
}

/// help coercion between zig type and C type vice versa
const coerce = struct {
    /// coerce from zig to C
    const loose = struct {
        /// check for integer coercion
        fn IntegerCoercion(info: std.builtin.Type.Int) type {
            if (info.bits > 64) @compileError("Cannot coerce integer bits larger 64 bits");

            const target = builtin.target;

            switch (info.signedness) {
                .signed => {
                    if (info.bits == target.cTypeBitSize(.char)) return c_char orelse
                        @compileError("Target machine does not have C ABI for type char");
                    if (info.bits == target.cTypeBitSize(.short)) return c_short orelse
                        @compileError("Target machine does not have C ABI for type short");
                    if (info.bits == target.cTypeBitSize(.int)) return c_int orelse
                        @compileError("Target machine does not have C ABI for type int");
                    if (info.bits == target.cTypeBitSize(.long)) return c_long orelse
                        @compileError("Target machine does not have C ABI for type long");
                    if (info.bits == target.cTypeBitSize(.longlong)) return c_longlong orelse
                        @compileError("Target machine does not have C ABI for type longlong");
                },
                .unsigned => {
                    if (info.bits == target.cTypeBitSize(.char)) return c_char orelse
                        @compileError("Target machine does not have C ABI for type char");
                    if (info.bits == target.cTypeBitSize(.ushort)) return c_ushort orelse
                        @compileError("Target machine does not have C ABI for type ushort");
                    if (info.bits == target.cTypeBitSize(.uint)) return c_uint orelse
                        @compileError("Target machine does not have C ABI for type uint");
                    if (info.bits == target.cTypeBitSize(.ulong)) return c_ulong orelse
                        @compileError("Target machine does not have C ABI for type ulong");
                    if (info.bits == target.cTypeBitSize(.ulonglong)) return c_ulonglong orelse
                        @compileError("Target machine does not have C ABI for type ulonglong");
                },
            }

            @compileError("target machine doesn't have native C integer mapping for type " ++
                if (info.signedness == .signed)
                    "signed "
                else
                    "unsigned " ++ std.fmt.comptimePrint("{d} ", .{info.bits}) ++ "bits");
        }

        fn FloatCoercion(info: std.builtin.Type.Float) type {
            const target = builtin.target;
            // double and float in C is fixed size therefore f32 and f64 will work perfectly fine with it
            // so most of the time i wouldn't even need this function
            if (info.bits == target.cTypeBitSize(.float)) return f32;
            if (info.bits == target.cTypeBitSize(.double)) return f64;
            if (info.bits == target.cTypeBitSize(.longdouble)) return c_char;
        }

        pub fn Primitive(T: type) type {
            const info = @typeInfo(T);
            if (info == .optional) if (T) |non_null| {
                return ?Primitive(non_null);
            };
            if (!isPrimitive(T)) @compileError("Expected primitive type found" ++ @typeName(T));

            return switch (info) {
                .int, .comptime_int => |t_int| IntegerCoercion(t_int),
                .float, .comptime_float => |t_float| FloatCoercion(t_float),
            };
        }
    };

    /// coerce from C to zig
    const strict = struct {
        /// C to Zig integer coercion
        fn IntegerCoercion(info: std.builtin.Type.Int) type {
            return @Int(info.signedness, info.bits);
        }

        fn FloatCoercion(comptime bits: comptime_int) type {
            return switch (bits) {
                32 => f32,
                64 => f64,
                80 => f80,
                128 => f128,
            };
        }

        pub fn Primitive(T: type) type {
            const info = @typeInfo(T);
            if (info == .optional) if (T) |non_null| {
                return ?Primitive(non_null);
            };
            if (!isPrimitive(T)) @compileError("Expected primitive type found" ++ @typeName(T));

            switch (info) {
                .int => |t_int| return IntegerCoercion(t_int),
                .float => |t_float| return FloatCoercion(t_float.bits),
                else => @compileError(@typeName(T) ++ " unhandled by coerce.strict.primitive"),
            }
        }

        pub fn OnePtr(comptime T: type) type {
            switch (@typeInfo(T)) {
                .optional => |optional_info| return ?OnePtr(optional_info.child),
                .pointer => |ptr_info| {
                    if (ptr_info.size != .c) @compileError("can only convert from C pointer to zig one pointer");
                    return @Pointer(.one, ptr_info.attrs, ptr_info.child, null);
                },
                else => @compileError("OnePtr expected pointer type but receive type: " ++ @typeName(T)),
            }
        }
        //
        // pub fn Slice(comptime T: type) type {
        //     const info = @typeInfo(T);
        //     switch (info) {
        //         .optional => |optional_info| return ?OnePtr(optional_info.child),
        //         .pointer => |ptr_info| {
        //             if (ptr_info.size != .c) @compileError("can only convert from C pointer to zig one pointer");
        //         },
        //     }
        // }
    };
};

pub inline fn primitiveCoercion(arg: anytype, cfg: CoercionsConfigs) if (cfg.to == .c)
    coerce.loose.Primitive(@TypeOf(arg))
else
    coerce.strict.Primitive(@TypeOf(arg)) {
    // all of this will be simplified to a single return after compiled
    const ArgType = @TypeOf(arg);
    const arg_type_info = if (@typeInfo(ArgType) == .optional)
        @typeInfo(ArgType).child
    else
        @typeInfo(ArgType);

    switch (cfg.to) {
        .c => {
            switch (arg_type_info) {
                .int => return @intCast(arg),
                .float => return @floatCast(arg),
                else => @compileError("Cannot coerce type " ++ @typeName(ArgType) ++ " using primitiveCoercion"),
            }
        },
        .zig => {
            switch (arg_type_info) {
                .int => return @intCast(arg),
                .float => return @floatCast(arg),
                else => @compileError("Cannot coerce type " ++ @typeName(ArgType) ++ " using primitiveCoercion"),
            }
        },
    }
}

/// only used for single item pointer
pub inline fn ptrCoercion(ptr: anytype, cfg: CoercionsConfigs) ret_T: {
    if (cfg.ptr_config) |ptr_cfg| {
        switch (ptr_cfg) {
            .one => break :ret_T coerce.strict.OnePtr(@TypeOf(ptr)),
            else => @compileError("not yet implemented"),
        }
    } else @compileError("Must specify pointer coercion config for pointer coercion");
} {
    return @ptrCast(ptr);
}
// NOTE: just use std.mem.span for converting C array to zig slice

/// tell where is this from to coerce to the other
const To = union(enum) {
    c: void,
    zig: void,
};

/// coerce pointer type to what pointer (from C pointer to zig not the other way around)
const PointerCoerceTo = union(enum) {
    one: void,
    /// try to avoid this it's not good just use slice
    many: void,
    slice: void,
};

pub const CoercionsConfigs = struct {
    to: To,
    /// used to dictate what zig pointer type will a C pointer coerce to
    /// use this for any pointer besides anyopque since zig anyopque pointer already
    /// compatible with C *void, while converting from Zig pointer to C poitner you likely doesn't need
    /// this since most of the time you can just pass zig pointer directly to C without even casting since
    /// C pointer is very loose
    ptr_config: ?PointerCoerceTo = null,
};

pub inline fn coercions(any: anytype, comptime cfg: CoercionsConfigs) ret_T: {
    const Type = @TypeOf(any);
    if (isPrimitive(Type)) {
        switch (cfg.to) {
            .c => break :ret_T coerce.loose.Primitive(Type),
            .zig => break :ret_T coerce.strict.Primitive(Type),
        }
    } else if (isPtr(Type)) {
        if (cfg.to == .c) @compileError("pointer coercion from zig pointer to C pointer can " ++
            "be done easily except for slice so i only need to add coercion for slice but it is " ++
            "still impossible to do it without copying the string so fuck");
        if (cfg.ptr_config) |ptr_cfg| {
            switch (ptr_cfg) {
                .one => break :ret_T coerce.strict.OnePtr(Type),
                else => @compileError("i haven't make it"),
            }
        } else @compileError("trying to coerce pointer type without providing pointer coercion config");
    } else @compileError("add later");
} {
    const Type = @TypeOf(any);
    comptime if (isPrimitive(Type))
        return primitiveCoercion(any, cfg);
    comptime if (isPtr(Type)) {
        return ptrCoercion(any, cfg);
    };
    unreachable;
}

test "c to zig primitive coercion" {
    const Test_types = @Tuple(&.{
        c_longlong,
        c_ulong,
        c_int,
    });
    const t_val = Test_types{
        @as(c_longlong, '0'),
        @as(c_ulong, 3264),
        @as(c_int, 32),
    };

    inline for (t_val, 0..) |v, i| {
        const expect_type =
            switch (i) {
                0 => @Int(.signed, 64),
                1 => @Int(.unsigned, 64),
                2 => @Int(.signed, 32),
                else => @compileError("how did we get here"),
            };
        const r_val = coercions(v, .{ .to = .zig });
        std.debug.print("the type is: {any}\n", .{@TypeOf(r_val)});
        try std.testing.expect(@TypeOf(r_val) == expect_type);
    }
}

// NOTE: this case is this shitty find better solution later
test "zig to C primtivie Coercion" {
    const Test_types = @Tuple(&.{
        u64,
        u8,
        i32,
    });
    const t_val = Test_types{
        @as(u64, 64),
        @as(u8, '0'),
        @as(i32, 32),
    };

    inline for (t_val, 0..) |v, i| {
        const expect_type =
            switch (i) {
                0 => c_ulonglong,
                1 => c_char,
                2 => c_int,
                else => @compileError("how did we get here"),
            };
        const r_val = coercions(v, .{ .to = .zig });
        std.debug.print("the type is: {any}\n", .{@TypeOf(r_val)});
        try std.testing.expect(@TypeOf(r_val) == expect_type);
    }
}
