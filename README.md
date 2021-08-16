# zig-raylib-flecs-3d
Some FLECS components and systems for Raylib 3D in Zig

for use with the template at https://github.com/MadScientist2854/zig-raylib-flecs-template, but you can use it in any project if you just hook this up properly; call the `init` and `deinit` functions from init.zig, have the right dependencies, and set up raylib properly and make sure that rendering starts and ends at the right time.

if you're using the template, just call the 3D `init` from the template's `init.zig`, clear the example entities, and `usingnamespace` the 3D components and systems inside the template's component and system files.