const std = @import("std");
const flecs = @import("flecs");
const rl = @import("raylib.zig");
const components = @import("components/export.zig");
const systems = @import("systems/export.zig");

pub fn init(world: *flecs.World, allocator: *std.mem.Allocator) std.mem.Allocator.Error!void {
    // add components and systems
    components.init(world);
    systems.init(world);

    // create raylib camera
    var rlcamera = try allocator.create(rl.Camera);
    rlcamera.* = rl.Camera {
        .position = rl.Vector3{ .x = 5, .y = 4, .z = 5 },
        .target = rl.Vector3{ .x = 0, .y = 2, .z = 0 },
        .up = rl.Vector3{ .x = 0, .y = 1, .z = 0 },
        .fovy = 45,
        .projection = rl.CAMERA_PERSPECTIVE
    };

    // add entities
    const ecamera = world.new();
    world.set(ecamera, &components.Camera{
        .camera = rlcamera
    });
    rl.SetCameraMode(rlcamera.*, rl.CAMERA_FIRST_PERSON);

    const ecube = world.new();
    world.set(ecube, &components.Cube{
        .size = rl.Vector3 {
            .x = 10,
            .y = 5,
            .z = 10
        },
        .color = rl.RED,
        .cam_ptr = rlcamera
    });
    world.set(ecube, &components.Position{
        .x = -10,
        .y = 0,
        .z = -10
    });

    const egrid = world.new();
    world.set(egrid, &components.Grid{
        .slices = 50,
        .spacing = 1,
        .cam_ptr = rlcamera
    });
}