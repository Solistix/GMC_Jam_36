/// @description Insert description here
// You can write your code in this editor
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
attack = 5;
previous_target = 0;
ds_grid_set(global.room_grid_trigger, coords[0], coords[1], id);
visible=false