const flecs = @import("flecs");
const rl = @import("../raylib.zig");
const components = @import("../components/export.zig");

pub fn update_camera(it: *flecs.ecs_iter_t) callconv(.C) void {
    const cameras = it.column(components.Camera, 1);

    var i: usize = 0;
    while (i < it.count) : ( i += 1 ) {
        const rlcamera = cameras[i].camera;
        rl.UpdateCamera(rlcamera);
    }
}