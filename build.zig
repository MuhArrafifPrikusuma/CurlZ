const std = @import("std");
const builtin = @import("builtin");
const Build = std.Build;
const Module = std.Build.Module;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const manifest = try parseManifest(b);
    defer manifest.deinit(b.allocator);

    const opt = b.addOptions();
    opt.addOption([]const u8, "version", manifest.version);
    const build_info_mod = opt.createModule();

    const mod = b.addModule("CurlZ", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    const c_module = createCBindingsModule(b, target, optimize);
    mod.addImport("c", c_module);
    mod.addImport("build_info", build_info_mod);

    const test_file = b.option([]const u8, "test-filter", "test specific file");
    const options = b.addOptions();
    options.addOption(bool, "run_all_test", test_file == null);

    const test_source_file = if (test_file) |file|
        b.path(file)
    else
        b.path("src/root.zig");

    const test_helper = b.addModule("mock server for testing", .{
        .root_source_file = b.path("test/testHelper.zig"),
        .target = target,
        .optimize = optimize,
    });

    inline for (.{ "basic", "multi" }) |name| {
        try addExample(b, name, mod, test_helper, target, optimize);
    }

    const mod_test = b.addTest(.{
        .root_module = b.addModule("mod_test", .{
            .root_source_file = test_source_file,
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    mod_test.root_module.addOptions("build_options", options);
    mod_test.root_module.addImport("testing", test_helper);
    mod_test.root_module.addImport("c", c_module);
    mod_test.root_module.addImport("build_info", build_info_mod);

    const test_step = b.step("test", "Run tests");

    const run_mod_tests = b.addRunArtifact(mod_test);
    test_step.dependOn(&run_mod_tests.step);
}

fn createCBindingsModule(
    b: *Build,
    target: Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) *Module {
    const translate_c = b.addTranslateC(.{
        .root_source_file = b.path("src/c.h"),
        .target = target,
        .optimize = optimize,
    });

    translate_c.link_libc = true;

    translate_c.linkSystemLibrary("curl", .{ .preferred_link_mode = .static });

    return translate_c.createModule();
}

const Manifest = struct {
    version: []const u8,

    fn deinit(self: Manifest, allocator: std.mem.Allocator) void {
        allocator.free(self.version);
    }
};

fn parseManifest(b: *Build) !Manifest {
    const input = @embedFile("build.zig.zon");
    var diagnostic: std.zon.parse.Diagnostics = undefined;

    const parsed = std.zon.parse.fromSlice(Manifest, .{
        .arena = b.allocator,
        .diagnostics = &diagnostic,
        .gpa = b.allocator,
        .source = input,
        .ignore_unknown_fields = true,
    }) catch |err| {
        std.debug.print("parse error: \n{f}\n", .{diagnostic.fmt("build.zig.zon")});
        return err;
    };

    return parsed;
}

fn addExample(
    b: *Build,
    comptime name: []const u8,
    curl_module: *Module,
    testinghelper_module: *Module,
    target: Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) !void {
    const exe = b.addExecutable(.{
        .name = name,
        .root_module = b.createModule(.{
            .root_source_file = b.path("example/" ++ name ++ ".zig"),
            .link_libc = true,
            .optimize = optimize,
            .target = target,
        }),
    });
    b.installArtifact(exe);
    exe.root_module.addImport("curl", curl_module);
    exe.root_module.addImport("testing", testinghelper_module);

    const run_step = b.step(
        "run-example=" ++ name,
        std.fmt.comptimePrint("Run {s} example", .{name}),
    );
    run_step.dependOn(&b.addRunArtifact(exe).step);
}
