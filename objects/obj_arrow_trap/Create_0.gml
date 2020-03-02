/// @description Insert description here
// You can write your code in this editor
initial_attack_counter = 1; // For counter reset
attack_counter = initial_attack_counter;
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
attack = 5;
arrows = 1;
ds_grid_set(global.room_grid, coords[0], coords[1], id);

visible=false