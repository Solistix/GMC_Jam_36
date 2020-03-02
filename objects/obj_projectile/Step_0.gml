/// @description Insert description here
// You can write your code in this editor
if (global.state == "TRAP TURN") {
	var dir = get_direction_cartesian(is_moving);
	ds_grid_set(global.room_grid_projectile, coords[0], coords[1], 0);
	coords[0] += dir[0];
	coords[1] += dir[1];
	if (!in_bounds(coords)) instance_destroy();
	var target = ds_grid_get(global.room_grid, coords[0], coords[1]);
	if (target != 0) {
		if (target == 1 || !in_bounds(coords)) { 
			instance_destroy();
		} else if (!target.object_index == obj_player && 
				!object_get_parent(target.object_index) == obj_enemy) instance_destroy();
		else {
			target.hp -= attack;
			spike_ball_bounce(target, is_moving)
		}
	}
	ds_grid_set(global.room_grid_projectile, coords[0], coords[1], id);
	planned_move = coords;
} else if (global.state == "TRAP ANIMATION") {
	if (planned_move != 0) {
		x = planned_move[0] * global.grid_cell_size;
		y = planned_move[1] * global.grid_cell_size;
		planned_move = 0;
	}
	animation_done = true;
}