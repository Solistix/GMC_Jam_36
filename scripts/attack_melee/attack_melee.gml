// attack_melee()
var dir_cartesian = get_direction_cartesian(is_facing);
if (in_bounds([coords[0] + dir_cartesian[0], coords[1] + dir_cartesian[1]])) {
	var target = ds_grid_get(global.room_grid, coords[0] + dir_cartesian[0], coords[1] + dir_cartesian[1]);
	if (target != 0 && target != 1) {
		if (object_get_parent(target.object_index) == obj_enemy) {
			target.hp -= attack;
		}
	}
}