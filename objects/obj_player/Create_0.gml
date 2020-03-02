/// @description Insert description here
// You can write your code in this editor

hp = 100;
attack = 5;
is_facing = "DOWN"; // The direction the character is facing
image_angle=convert_direction(is_facing)
weapons = ["MELEE", "RANGED", "MAGIC"];
equipped_weapon = 0;
action_counter = 0; // Amount of actions per turn
arrows = 10;
x=(x div 32)*global.grid_cell_size
y=(y div 32)*global.grid_cell_size
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
planned_move = 0;
animation_done=false
z=0
rot_dir=0
global.player = ds_grid_set(global.room_grid, coords[0], coords[1], id);