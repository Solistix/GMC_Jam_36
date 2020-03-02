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
	if (planned_move != 0) {
		
		var new_x = planned_move[0] * global.grid_cell_size
		var new_y = planned_move[1] * global.grid_cell_size
		
		x = lerp(x,new_x, 0.2);
		y = lerp(y,new_y, 0.2);
		
		if (abs(x-new_x)<=1 && abs(y-new_y)<=1) {
			x=new_x
			y=new_y
			animation_done=true
			planned_move = 0;
		}
	}
}
