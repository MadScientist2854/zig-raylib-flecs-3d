const rl = @import("raylib");

pub const Cube = struct {
    size: rl.Vector3,
    color: rl.Color,
    cam_ptr: *rl.Camera
};

pub const Grid = struct {
    slices: i32,
    spacing: f32,
    cam_ptr: *rl.Camera
};