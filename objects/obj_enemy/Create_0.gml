/// @description Insert description here
// You can write your code in this editor

is_facing = "DOWN";
image_angle=convert_direction(is_facing)
planned_move = 0; // For animation phase
x=(x div 32)*global.grid_cell_size
y=(y div 32)*global.grid_cell_size
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
ds_grid_set(global.room_grid, coords[0], coords[1], id);
animation_done=false
z=0
rot_dir=0