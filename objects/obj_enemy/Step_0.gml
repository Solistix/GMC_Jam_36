/// @description Insert description here
// You can write your code in this editor

// Destroys enemy if hp is 0 and below
if (hp <= 0) {	
	if (alarm[0]==0) {
		ds_grid_set(global.room_grid, coords[0], coords[1], 0);
		instance_destroy()
	}
}
else
{
	if global.state == "ENEMY TURN" {
		var path = get_shortest_path(coords, global.player.coords);
		var grid_x = path[|1] mod global.grid_width;
		var grid_y = floor(path[|1] / global.grid_width);
		var did_collide = check_collision(grid_x, grid_y);
	
		if (coords[0] == grid_x && coords[1] - 1 == grid_y){
			is_facing = "UP";
		} else if (coords[0] == grid_x && coords[1] + 1 == grid_y){
			is_facing = "DOWN";
		} else if (coords[0] - 1 == grid_x && coords[1] == grid_y){
			is_facing = "LEFT";
		} else if (coords[0] + 1 == grid_x && coords[1] == grid_y){
			is_facing = "RIGHT";
		}
	
		if (!did_collide) {
			move_object(is_facing)
		
			TweenEasyMove(x,y,planned_move[0] * global.grid_cell_size,planned_move[1] * global.grid_cell_size,0,global.rm_spd*0.5,EaseInOutQuad)
			tween_z(0,4,0,global.rm_spd*0.5,EaseOutExpo)
			tween_z(4,0,global.rm_spd*0.5,global.rm_spd*0.5,EaseOutBounce)
			TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(is_facing)),0,global.rm_spd*0.5,EaseOutQuad)
			alarm[0]=60
		
		} else if(did_collide != 1 && did_collide.object_index == obj_player) {
			TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(is_facing)),0,global.rm_spd*0.5,EaseOutQuad)
		
			TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(is_facing)),0,global.rm_spd*0.25,EaseOutQuad)
			TweenEasyMove(x+lengthdir_x(0.5,convert_direction(is_facing)-90)*global.grid_cell_size,y-lengthdir_y(0.5,convert_direction(is_facing)-90)*global.grid_cell_size,x,y,global.rm_spd*0.25,global.rm_spd*0.25,EaseInOutQuad)
			with(obj_player) {
				TweenEasyRotate(image_angle,image_angle-angle_difference(image_angle,convert_direction(other.is_facing)+180),0,global.rm_spd*0.25,EaseOutQuad)
				tween_dir(-45,0,global.rm_spd*0.25,global.rm_spd,EaseOutElastic)
			}
			alarm[0]=global.rm_spd*1.25
		
			global.player.hp -= attack;
		}
		ds_list_destroy(path);
	} else if (global.state == "ENEMY ANIMATION") {
		if (planned_move != 0) {	
			if (alarm[0]==0) {
				animation_done=true
				planned_move = 0;
			}
		}
	}
}