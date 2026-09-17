const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("CurlZ", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    const exe = b.addExecutable(.{
        .name = "CurlZ",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "CurlZ", .module = mod },
            },
        }),
    });

    if (optimize == .debug) {
        exe.root_module.sanitize_c = .full;
        exe.root_module.sanitize_thread = true;
    }
    if (optimize == .fast or optimize == .small) {
        exe.root_module.strip = true;

        exe.discard_local_symbols = true;
    }

    exe.root_module.addIncludePath(.{ .cwd_relative = "/usr/include" });
    exe.root_module.linkSystemLibrary("curl", .{});

    exe.root_module.linkSystemLibrary("curl", .{
        .needed = true,
        .search_strategy = .paths_first,
        .preferred_link_mode = .static,
    });

    b.installArtifact(exe);

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    run_cmd.addPassthruArgs();

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
