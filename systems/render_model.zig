const flecs = @import("flecs");
const rl = @import("../raylib.zig");
const components = @import("../components/export.zig");

pub fn render_model(it: *flecs.ecs_iter_t) callconv(.C) void {
    const models = it.column(components.Model, 1);
    const positions = it.column(components.Position, 2);

    var i: usize = 0;
    while (i < it.count) : ( i += 1 ) {
        const camera = models[i].cam_ptr.*;
        const model = models[i].model;
        const pos = positions[i];
        const scale = models[i].scale;
        const tint = models[i].tint;

        rl.BeginMode3D(camera);

            rl.DrawGrid(10, 1);
            rl.DrawModel(model, rl.Vector3{.x = pos.x, .y = pos.y, .z = pos.z}, scale, tint);

        rl.EndMode3D();
    }
}