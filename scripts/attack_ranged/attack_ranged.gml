// attack_ranged(range, use_arrow);
var dir_cartesian = get_direction_cartesian(is_facing); // The range of the arrows
var dir_sign = [sign(dir_cartesian[0]), sign(dir_cartesian[1])];
dir_cartesian[0] *= argument0;
dir_cartesian[1] *= argument0;

if (arrows > 0) {
	if (argument1) arrows--; // Only the player has limited ammo
	var attacked = 0;
	for (var i = 0; i < abs(dir_cartesian[0]) + 1; i++) {
		for (var j = 0; j < abs(dir_cartesian[1]) + 1; j++) {
			if (i == 0 && j == 0){
				continue;
			}
			if (in_bounds([coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j])) {
				var target = ds_grid_get(global.room_grid, coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j);
				if (target != 0 && target != 1) {
					if (object_get_parent(target.object_index) == obj_enemy || target.object_index == obj_player) {
						target.hp -= attack;
						attacked = 1;
						break;
					}
				}
				if (target) {
					// Wall collision or non-damagable object
					attacked = 1;
					break;
				}
			}
		}
		if (attacked) break;
	}
}