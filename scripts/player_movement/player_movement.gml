// player_movement(did_collide)
if (!argument0) {
	move_object(is_facing);
	player_did_action();
	global.state = "PLAYER ANIMATION"
	animation_done=false;
} else if(argument0 != 1 && object_get_parent(argument0.object_index) == obj_enemy) {
	attack_melee();
	player_did_action();
}