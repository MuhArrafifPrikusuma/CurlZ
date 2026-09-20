const std = @import("std");
const Build = std.Build;
const Module = std.Build.Module;

pub fn build(b: *Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("CurlZ", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    mod.link_libc = true;

    const libcurl = createCBindingsModule(b, target, optimize);
    mod.addImport("c", libcurl);

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "curlZ", .module = mod },
        },
    });

    const exe = b.addExecutable(.{
        .name = "example",
        .root_module = exe_mod,
    });

    if (optimize == .debug) {
        exe.root_module.sanitize_c = .full;
        exe.root_module.sanitize_thread = true;
    }
    if (optimize == .fast or optimize == .small) {
        exe.root_module.strip = true;
        exe.discard_local_symbols = true;
    }

    b.installArtifact(exe);

    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());
    run_cmd.addPassthruArgs();

    const test_step = b.step("test", "Run tests");

    const mod_tests = b.addTest(.{ .root_module = mod });
    const run_mod_tests = b.addRunArtifact(mod_tests);
    test_step.dependOn(&run_mod_tests.step);

    const exe_tests = b.addTest(.{ .root_module = exe.root_module });
    const run_exe_tests = b.addRunArtifact(exe_tests);
    test_step.dependOn(&run_exe_tests.step);
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

    translate_c.linkSystemLibrary("curl", .{});

    return translate_c.createModule();
}
