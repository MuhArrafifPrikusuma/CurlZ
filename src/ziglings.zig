const std = @import("std");
const builtin = @import("builtin");

fn isPrimitive(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .void, .type, .noreturn => @compileError("Cannot coerce Type" ++ @typeName(T)),
        .int, .float, .comptime_float, .comptime_int => true,
        else => false,
    };
}

fn isPtr(T: type) bool {
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

            if (info.signedness == .signed) {
                if (info.bits == target.cTypeBitSize(.char)) return c_char;
                if (info.bits == target.cTypeBitSize(.short)) return c_short;
                if (info.bits == target.cTypeBitSize(.int)) return c_int;
                if (info.bits == target.cTypeBitSize(.long)) return c_long;
                if (info.bits == target.cTypeBitSize(.longlong)) return c_longlong;
            } else if (info.signedness == .unsigned) {
                if (info.bits == target.cTypeBitSize(.char)) return c_char;
                if (info.bits == target.cTypeBitSize(.short)) return c_ushort;
                if (info.bits == target.cTypeBitSize(.int)) return c_uint;
                if (info.bits == target.cTypeBitSize(.long)) return c_ulong;
                if (info.bits == target.cTypeBitSize(.longlong)) return c_ulonglong;
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
            if (!isPrimitive(T)) @compileError("Expected primitive type found" ++ @typeName(T));
            const type_info = @typeInfo(T);

            return switch (type_info) {
                .int, .comptime_int => |t_int| IntegerCoercion(t_int),
                // float only support double
                .float, .comptime_float => |t_float| FloatCoercion(t_float),
            };
        }
    };

    /// coerce from C to zig
    const strict = struct {
        pub fn Primitive(T: type) type {
            if (!isPrimitive(T)) @compileError("Expected primitive type found" ++ @typeName(T));
            const type_info = @typeInfo(T);

            switch (type_info) {}
        }

        pub fn OnePtr(comptime ptr: std.builtin.Type.Pointer) type {
            if (ptr.size != .c) @compileError("already zig pointer");
            // NOTE: pointer coercion from C pointer should always allowzero
            const NewPointer = std.builtin.Type.Pointer{
                .size = .one,
                .attrs = .{
                    .@"addrspace" = ptr.attrs.@"addrspace",
                    .@"const" = ptr.attrs.@"const",
                    .@"align" = ptr.attrs.@"align",
                    .@"allowzero" = true,
                    .@"volatile" = ptr.attrs.@"volatile",
                },
                .child = ptr.child,
                .sentinel_ptr = null,
            };
            return @Pointer(
                NewPointer.size,
                NewPointer.attrs,
                NewPointer.child,
                NewPointer.sentinel_ptr,
            );
        }
    };
};

pub inline fn primitiveCoercion(arg: anytype) coerce.loose.Primitive(@TypeOf(arg)) {
    // all of this will be simplified to a single return after compiled
    const ArgType = @TypeOf(arg);
    const arg_type_info = @typeInfo(ArgType);

    switch (arg_type_info) {
        .int, .comptime_int => return @as(coerce.loose.Primitive(ArgType), @intCast(arg)),
        .float, .comptime_float => return @as(c_longdouble, @floatCast(arg)),
    }
}

/// only used for single item pointer
pub inline fn cPtrToOnePtrCoercion(ptr: anytype) coerce.strict.OnePtr(
    if (isPtr(@TypeOf(ptr))) @typeInfo(@TypeOf(ptr)).pointer else @compileError(
        "Trying to coerce non pointer type to pointer type",
    ),
) {
    return @ptrCast(ptr);
}

/// tell where is this from to coerce to the other
const From = union(enum) {
    c: void,
    zig: void,
};

/// coerce pointer type to what pointer (from C pointer to zig not the other way around)
const PointerCoerceTo = union(enum) {
    one: void,
    many: void,
    slice: void,
};

pub const CoercionsConfigs = packed struct {
    from: From,
    /// used to dictate what zig pointer type will a C pointer coerce to
    /// use this for any pointer besides anyopque since zig anyopque pointer already
    /// compatible with C *void, while converting from Zig pointer to C poitner you likely doesn't need
    /// this either most of the time you can just pass zig pointer directly to C without even casting since
    /// C pointer is very loose
    ptr_cfg: ?PointerCoerceTo,
};

pub inline fn coercions(any: anytype, cfg: CoercionsConfigs) !ret_T: {
    const TypeOfAny = @TypeOf(any);
    if (isPrimitive(TypeOfAny)) {
        switch (cfg.from) {
            .c => {}, // NOTE: doesn't have it yet
            .zig => break :ret_T coerce.loose.Primitive(TypeOfAny),
        }
    } else if (isPtr(TypeOfAny)) {
        if (cfg.ptr_cfg) |ptr_cfg| {
            switch (ptr_cfg) {
                .one => coerce.strict.OnePtr(@typeInfo(TypeOfAny)),
            }
        }
    }
} {}
