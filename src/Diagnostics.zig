const std = @import("std");
const c = @import("curl.zig");

const CurlCodes = union(enum) {
    code: c.CURLcode,
    mcode: c.CURLMcode,
};

const Self = @This();

err_code: ?CurlCodes = null,

pub fn getMessage(self: *Self) ?[]const u8 {
    const error_code = self.err_code orelse return null;
    return switch (error_code) {
        .code => |code| std.mem.span(c.curl_easy_strerror(code)),
        .m_code => |mcode| std.mem.span(c.curl_multi_strerror(mcode)),
    };
}

pub inline fn checkError(self: *Self, code: c.CURLcode) !void {
    if (code == c.CURLE_OK)
        return;

    self.err_code = .{ .code = code };
    return error.Curl;
}

pub inline fn checkMError(self: *Self, mcode: c.CURLMcode) !void {
    if (mcode == c.CURLM_ok)
        return;

    self.err_code = .{ .mcode = mcode };
    return error.Curlm;
}
