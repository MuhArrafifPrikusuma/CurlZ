const std = @import("std");
const c = @import("c");

const Writer = std.Io.Writer;

const CurlCodes = union(enum) {
    code: c.CURLcode,
    mcode: c.CURLMcode,
    hcode: c.CURLHcode,
};

const Self = @This();

err_code: ?CurlCodes = null,

fn header_strerr(code: c.CURLHcode) []const u8 {
    return switch (code) {
        1 => "Header error: Bad Index",
        2 => "Header error: Header Missing",
        3 => "Header error: No Header Found",
        4 => "Header error: No Request",
        5 => "Header error: Out Of Memory",
        6 => "Header error: Bad Argument",
        else => @panic("Header error: Invalid Header Code"),
    };
}

pub fn getMessage(self: *Self) ?[]const u8 {
    const error_code = self.err_code orelse return null;
    return switch (error_code) {
        .code => |code| std.mem.span(c.curl_easy_strerror(code)),
        .mcode => |mcode| std.mem.span(c.curl_multi_strerror(mcode)),
        .hcode => |hcode| header_strerr(hcode),
    };
}

/// print raw message from curl, return null if there is no message
pub inline fn printMessage(self: *Self, writer: *Writer) ?void {
    if (self.getMessage()) |msg| {
        try writer.print("{s}", .{msg});
    } else return null;
}

pub inline fn checkError(self: *Self, code: c.CURLcode) !void {
    if (code == c.CURLE_OK)
        return;

    self.err_code = .{ .code = code };
    return error.Curl;
}

pub inline fn checkMError(self: *Self, mcode: c.CURLMcode) !void {
    if (mcode == c.CURLM_OK)
        return;

    self.err_code = .{ .mcode = mcode };
    return error.Curlm;
}

pub inline fn checkHError(self: *Self, hcode: c.CURLHcode) !void {
    if (hcode == c.CURLHE_OK)
        return;

    self.err_code = .{ .hcode = hcode };
    return error.Curlh;
}
