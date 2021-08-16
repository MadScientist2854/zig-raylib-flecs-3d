const flecs = @import("flecs");
const rl = @import("../raylib.zig");
const components = @import("../components/export.zig");

pub fn render_cube(it: *flecs.ecs_iter_t) callconv(.C) void {
    const cubes = it.column(components.Cube, 1);
    const positions = it.column(components.Position, 2);

    var i: usize = 0;
    while (i < it.count) : ( i += 1 ) {
        const camera = cubes[i].cam_ptr.*;
        const size = cubes[i].size;
        const pos = positions[i];
        const color = cubes[i].color;

        rl.BeginMode3D(camera);

            rl.DrawCube(rl.Vector3{.x = pos.x, .y = pos.y, .z = pos.z}, size.x, size.y, size.z, color);

        rl.EndMode3D();
    }
}

pub fn render_grid(it: *flecs.ecs_iter_t) callconv(.C) void {
    const grids = it.column(components.Grid, 1);

    var i: usize = 0;
    while (i < it.count) : ( i += 1 ) {
        const camera = grids[i].cam_ptr.*;
        const slices = grids[i].slices;
        const spacing = grids[i].spacing;

        rl.BeginMode3D(camera);

            rl.DrawGrid(slices, spacing);

        rl.EndMode3D();
    }
}