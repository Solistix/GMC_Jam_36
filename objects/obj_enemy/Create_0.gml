/// @description Insert description here
// You can write your code in this editor

is_facing = "DOWN";
planned_move = 0; // For animation phase
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
ds_grid_set(global.room_grid, coords[0], coords[1], id);