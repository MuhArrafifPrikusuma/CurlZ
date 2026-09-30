const std = @import("std");
const c = @import("c");

const Writer = std.Io.Writer;

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
        .mcode => |mcode| std.mem.span(c.curl_multi_strerror(mcode)),
    };
}

/// print raw message from curl, return null if there is no message
pub fn printMessage(self: *Self, writer: *Writer) ?void {
    if (self.getMessage()) |msg| {
        try writer.print("{s}", .{msg});
    } else return null;
}

pub fn checkError(self: *Self, code: c.CURLcode) !void {
    if (code == c.CURLE_OK)
        return;

    self.err_code = .{ .code = code };
    return error.Curl;
}

pub fn checkMError(self: *Self, mcode: c.CURLMcode) !void {
    if (mcode == c.CURLM_OK)
        return;

    self.err_code = .{ .mcode = mcode };
    return error.Curlm;
}
