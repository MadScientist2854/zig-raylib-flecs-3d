const flecs = @import("flecs");

pub usingnamespace @import("3d.zig");
pub usingnamespace @import("camera.zig");
pub usingnamespace @import("model.zig");
pub usingnamespace @import("3dshapes.zig");

pub fn init(world: *flecs.World) void {
    _ = world.newComponent(Position3D);
    _ = world.newComponent(Camera);
    _ = world.newComponent(Model);
    _ = world.newComponent(Cube);
    _ = world.newComponent(Grid);
}