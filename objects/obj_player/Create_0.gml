/// @description Insert description here
// You can write your code in this editor

hp = 100;
attack = 5;
is_facing = "DOWN"; // The direction the character is facing
weapons = ["MELEE", "RANGED", "MAGIC"];
equipped_weapon = 0;
action_counter = 0; // Amount of actions per turn
arrows = 10;
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
planned_move = 0;

global.player = ds_grid_set(global.room_grid, coords[0], coords[1], id);