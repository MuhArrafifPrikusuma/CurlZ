//! ziglings contain helper for library functions, for user helper functions check help.zig
const std = @import("std");
const builtin = @import("builtin");

fn isPrimitive(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .optional => |optional_info| isPrimitive(optional_info.child),
        .void, .type, .noreturn => @compileError("Cannot coerce Type" ++ @typeName(T)),
        .comptime_float, .comptime_int => @compileError("If it's comptime known value just cast it immediately"),
        .int, .float => true,
        else => false,
    };
}

fn isPtr(T: type) bool {
    return switch (@typeInfo(T)) {
        .optional => |optional_info| @typeInfo(optional_info.child) == .pointer,
        .pointer => true,
        else => false,
    };
}

/// builtin.target.cTypeBitSize somehow doesn't work for me so just use this
const Ctype = enum {
    char,
    short,
    ushort,
    int,
    uint,
    long,
    ulong,
    longlong,
    ulonglong,
    float,
    double,
    longdouble,

    pub fn bitSize(c_type: Ctype) u16 {
        const Type = switch (c_type) {
            .char => c_char,
            .short => c_short,
            .ushort => c_ushort,
            .int => c_int,
            .uint => c_uint,
            .long => c_long,
            .ulong => c_ulong,
            .longlong => c_longlong,
            .ulonglong => c_ulonglong,
            .float => f32,
            .double => f64,
            .longdouble => c_longdouble,
        };
        if (@typeInfo(Type) == .int) return @typeInfo(Type).int.bits;
        if (@typeInfo(Type) == .float) return @typeInfo(Type).float.bits;
        unreachable;
    }
};

/// help coercion between zig type and C type vice versa
const coerce = struct {
    /// coerce from zig to C
    const loose = struct {
        /// check for integer coercion
        fn IntegerCoercion(info: std.builtin.Type.Int) type {
            if (info.bits > 64) @compileError("Cannot coerce integer bits larger 64 bits");

            switch (info.signedness) {
                .signed => {
                    if (info.bits == Ctype.bitSize(.char)) return c_char;
                    if (info.bits == Ctype.bitSize(.short)) return c_short;
                    if (info.bits == Ctype.bitSize(.int)) return c_int;
                    if (info.bits == Ctype.bitSize(.long)) return c_long;
                    if (info.bits == Ctype.bitSize(.longlong)) return c_longlong;
                },
                .unsigned => {
                    if (info.bits == Ctype.bitSize(.char)) return c_char;
                    if (info.bits == Ctype.bitSize(.ushort)) return c_ushort;
                    if (info.bits == Ctype.bitSize(.uint)) return c_uint;
                    if (info.bits == Ctype.bitSize(.ulong)) return c_ulong;
                    if (info.bits == Ctype.bitSize(.ulonglong)) return c_ulonglong;
                },
            }

            @compileError("target machine doesn't have native C integer mapping for type " ++
                if (info.signedness == .signed)
                    "signed "
                else
                    "unsigned " ++ std.fmt.comptimePrint("{d} ", .{info.bits}) ++ "bits");
        }

        fn FloatCoercion(info: std.builtin.Type.Float) type {
            if (info.bits == Ctype.bitSize(.float)) return f32;
            if (info.bits == Ctype.bitSize(.double)) return f64;
            if (info.bits == Ctype.bitSize(.longdouble)) return c_longdouble;
        }

        pub fn Primitive(T: type) type {
            const info = @typeInfo(T);
            if (info == .optional) if (T) |non_null| {
                return ?Primitive(non_null);
            };
            if (!isPrimitive(T)) @compileError("Expected primitive type found" ++ @typeName(T));

            return switch (info) {
                .int => |t_int| IntegerCoercion(t_int),
                .float => |t_float| FloatCoercion(t_float),
                else => @compileError(@typeName(T) ++ " in coerce.loose.Primitive"),
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
                else => @compileError("bit size not supported " ++ std.fmt.comptimePrint("{d}", .{bits}) ++ " bits"),
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

pub fn pointerSize(T: type) std.builtin.Type.Pointer.Size {
    return switch (@typeInfo(T)) {
        .optional => |optional_info| pointerSize(optional_info.child),
        .pointer => |ptr_info| ptr_info.size,
        else => @compileError("expected pointer type found: " ++ @typeName(T)),
    };
}

test "coerce.loose: comptime type reflection testing" {
    const tt = @Tuple(&.{
        u64,
        u32,
        u16,
        u8,
        i8,
        i16,
        i32,
        i64,
        f32,
        f64,
    });
    const tv = tt{
        @as(u64, 64),
        @as(u32, 32),
        @as(u16, 16),
        @as(u8, 8),
        @as(i8, 8),
        @as(i16, 16),
        @as(i32, 32),
        @as(i64, 64),
        @as(f32, 32.32),
        @as(f64, 64.64),
    };

    inline for (tv) |v| {
        const nt = coerce.loose.Primitive(@TypeOf(v));
        std.debug.print("converted from type {any} -> {any}\n", .{ @TypeOf(v), nt });
    }
}

test "coerce.strict: comptime type reflection testing" {
    const tt = @Tuple(&.{
        c_char,
        c_short,
        c_ushort,
        c_int,
        c_uint,
        c_long,
        c_ulong,
        c_longlong,
        c_ulonglong,
        f32,
        f64,
        c_longdouble,
    });

    const tv = tt{
        @as(c_char, 0),
        @as(c_short, 0),
        @as(c_ushort, 0),
        @as(c_int, 0),
        @as(c_uint, 0),
        @as(c_long, 0),
        @as(c_ulong, 0),
        @as(c_longlong, 0),
        @as(c_ulonglong, 0),
        @as(f32, 0),
        @as(f64, 0),
        @as(c_longdouble, 0),
    };

    inline for (tv) |v| {
        const nt = coerce.strict.Primitive(@TypeOf(v));
        std.debug.print("converted from type {any} -> {any}\n", .{ @TypeOf(v), nt });
    }
}

test "coercions: test coercion from C primitive to zig" {
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

    inline for (t_val) |v| {
        const expect_type = coerce.strict.Primitive(@TypeOf(v));

        const r_val = coercions(v, .{ .to = .zig });
        try std.testing.expect(@TypeOf(r_val) == expect_type);
        try std.testing.expect(r_val == v);
    }
}

// NOTE: this case is this shitty find better solution later
test "coercions: test coercions from zig primitive to C" {
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

    inline for (t_val) |v| {
        const expect_type = coerce.loose.Primitive(@TypeOf(v));
        const r_val = coercions(v, .{ .to = .c });
        try std.testing.expect(@TypeOf(r_val) == expect_type);
        try std.testing.expect(r_val == v);
    }
}
