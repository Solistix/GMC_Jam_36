/// @description Insert description here
// You can write your code in this editor
// Player Movement and Collision
if global.state == "PLAYER TURN" {
	if keyboard_check_pressed(global.key_move_up) {
		var did_collide = check_collision(coords[0], coords[1] - 1);
		is_facing = "UP"; // Must be up here so that they can attack the enemy in this direction
		player_movement(did_collide);
	} else if keyboard_check_pressed(global.key_move_left) {
		var did_collide = check_collision(coords[0] - 1, coords[1]);
		is_facing = "LEFT";
		player_movement(did_collide);
	} else if keyboard_check_pressed(global.key_move_down) {
		var did_collide = check_collision(coords[0], coords[1] + 1);
		is_facing = "DOWN";
		player_movement(did_collide);
	} else if keyboard_check_pressed(global.key_move_right) {
		var did_collide = check_collision(coords[0] + 1, coords[1]);
		is_facing = "RIGHT";
		player_movement(did_collide);
	}
	
	// Changes the direction the player is facing based on arrow key inputs
	change_player_facing();
	change_equipped_weapon();
	
	if (keyboard_check_pressed(global.key_attack)) {	
		player_attack(weapons[equipped_weapon]);
		player_did_action();
	}
} else if (global.state == "PLAYER ANIMATION") {
	if (alarm[0]==0) {
			animation_done=true
			planned_move = 0;
	}
}

if keyboard_check(ord("F")) && alarm[0]>-1
{
	alarm[0]=1
}

if keyboard_check(ord("G"))
{
	show_message(global.state)
	show_message(animation_done)
}
