const std = @import("std");
const c = @import("c");

pub const HeaderErrors = error{
    BadIndex,
    Missing,
    NoHeaders,
    NoRequest,
    OutOfMemory,
    BadArgument,
    NotBuiltIn,

    UnknownHeaderError,
};

pub fn headerFrom(code: c.CURLHcode) HeaderErrors!void {
    return switch (code) {
        c.CURLHE_OK => {},
        c.CURLHE_BADINDEX => HeaderErrors.BadIndex,
        c.CURLHE_MISSING => HeaderErrors.Missing,
        c.CURLHE_NOHEADERS => HeaderErrors.NoHeaders,
        c.CURLHE_NOREQUEST => HeaderErrors.NoRequest,
        c.CURLHE_OUT_OF_MEMORY => HeaderErrors.OutOfMemory,
        c.CURLHE_BAD_ARGUMENT => HeaderErrors.BadArgument,
        c.CURLHE_NOT_BUILT_IN => HeaderErrors.NotBuiltIn,
        else => HeaderErrors.UnknownHeaderError,
    };
}
