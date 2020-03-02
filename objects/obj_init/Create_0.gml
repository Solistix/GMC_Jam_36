/// @description Insert description here
// You can write your code in this editor

room_speed=60
global.rm_spd=60

global.state = "PLAYER TURN";

// Keybindings
// Movement
global.key_move_up = ord("W");
global.key_move_down = ord("S");
global.key_move_left = ord("A");
global.key_move_right = ord("D");

// Change Facing Direction
global.key_face_up = vk_up;
global.key_face_down = vk_down;
global.key_face_left = vk_left;
global.key_face_right = vk_right;

// End Turn
global.key_end_turn = ord("R");

// Switch Weapons
global.key_switch_weapon_left = ord("Q");
global.key_switch_weapon_right = ord("E");

// Attack
global.key_attack = vk_space;

global.grid_height = 10;
global.grid_width = 10;
global.room_grid = ds_grid_create(global.grid_width, global.grid_height);
global.grid_cell_size = 150;

generate_node_connections();