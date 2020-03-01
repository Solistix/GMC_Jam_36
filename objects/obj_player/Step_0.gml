/// @description Insert description here
// You can write your code in this editor
// Player Movement and Collision
if global.state == "PLAYER TURN" {
	if keyboard_check_pressed(global.key_move_up) {
		var did_collide = check_collision(coords[0], coords[1] - 1);
		is_facing = "UP"; // Must be up here so that they can attack the enemy in this direction
		if (!did_collide) {
			move_object("UP");
			player_did_action();
		} else if(did_collide != 1 && object_get_parent(did_collide.object_index) == obj_enemy) {
			attack_melee();
			player_did_action();
		}
	} else if keyboard_check_pressed(global.key_move_left) {
		var did_collide = check_collision(coords[0] - 1, coords[1]);
		is_facing = "LEFT";
		if (!did_collide) {
			move_object("LEFT");
			player_did_action();
		} else if(did_collide != 1 && object_get_parent(did_collide.object_index) == obj_enemy) {
			attack_melee();
			player_did_action();
		}
	} else if keyboard_check_pressed(global.key_move_down) {
		var did_collide = check_collision(coords[0], coords[1] + 1);
		is_facing = "DOWN";
		if (!did_collide) {
			move_object("DOWN");
			player_did_action();
		} else if(did_collide != 1 && object_get_parent(did_collide.object_index) == obj_enemy) {
			attack_melee();
			player_did_action();
		}
	} else if keyboard_check_pressed(global.key_move_right) {
		var did_collide = check_collision(coords[0] + 1, coords[1]);
		is_facing = "RIGHT";
		if (!did_collide) {
			move_object("RIGHT");
			player_did_action();
		} else if(did_collide != 1 && object_get_parent(did_collide.object_index) == obj_enemy) {
			attack_melee();
			player_did_action();
		}
	}
	
	// Changes the direction the player is facing based on arrow key inputs
	change_player_facing();
	change_equipped_weapon();
	
	if (keyboard_check_pressed(global.key_attack)) {	
		player_attack(weapons[equipped_weapon]);
		player_did_action();
	}
}
