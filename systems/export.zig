const flecs = @import("flecs");

pub usingnamespace @import("render_model.zig");
pub usingnamespace @import("update_camera.zig");
pub usingnamespace @import("render_3dshapes.zig");

pub fn init(world: *flecs.World) void {
    world.newSystem("Update Camera", .pre_update, "Camera", update_camera);
    world.newSystem("Render Models", .on_store, "Model, Position", render_model);
    world.newSystem("Render Cubes", .on_store, "Cube, Position", render_cube);
    world.newSystem("Render Grids", .on_store, "Grid", render_grid);
}