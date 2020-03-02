if (live_call()) return live_result
// player_movement(did_collide)


if (!argument0) {
	global.state = "PLAYER ANIMATION"
	animation_done=false;
	move_object(is_facing);
	player_did_action();
	TweenEasyMove(x,y,planned_move[0] * global.grid_cell_size,planned_move[1] * global.grid_cell_size,0,global.rm_spd*0.5,EaseInOutQuad)
	tween_z(0,4,0,global.rm_spd*0.5,EaseOutExpo)
	tween_z(4,0,global.rm_spd*0.5,global.rm_spd*0.5,EaseOutBounce)
	TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(is_facing)),0,global.rm_spd*0.5,EaseOutQuad)
	alarm[0]=global.rm_spd
	
} else if(argument0 != 1 && object_get_parent(argument0.object_index) == obj_enemy) {
	global.state = "PLAYER ANIMATION"
	animation_done=false;
	TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(is_facing)),0,global.rm_spd*0.25,EaseOutQuad)
	TweenEasyMove(x+lengthdir_x(0.5,convert_direction(is_facing)-90)*global.grid_cell_size,y-lengthdir_y(0.5,convert_direction(is_facing)-90)*global.grid_cell_size,x,y,global.rm_spd*0.25,global.rm_spd*0.25,EaseInOutQuad)
	with(argument0) {
		TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(other.is_facing)+180),0,global.rm_spd*0.25,EaseOutQuad)
		tween_dir(-45,0,global.rm_spd*0.25,global.rm_spd,EaseOutElastic)
	}
	alarm[0]=global.rm_spd*1.25
	attack_melee();
	if (argument0.hp<=0) {
		alarm[0]=global.rm_spd*2.75
		
		with(argument0) {
			alarm[0]=global.rm_spd*2.75
			tween_z(0,20,global.rm_spd*1.25,global.rm_spd*1.5,EaseInCirc)
		}
	}
	player_did_action();
}
