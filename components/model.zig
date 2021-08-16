const rl = @import("raylib");

pub const Model = struct {
    model: rl.Model,
    scale: f32,
    tint: rl.Color,
    cam_ptr: *rl.Camera
};