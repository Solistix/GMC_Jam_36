/// @description Insert description here
// You can write your code in this editor

hp = 100;
attack = 5;
action_counter = 0; // Amount of actions per turn
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
global.player = ds_grid_set(global.room_grid, coords[0], coords[1], id);