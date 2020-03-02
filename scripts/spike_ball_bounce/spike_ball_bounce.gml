// spike_ball_bounce(target, is_moving)
var grid_check = get_direction_cartesian(argument1);
var dir_sign = [sign(grid_check[0]), sign(grid_check[1])];
// Bounce back two places
grid_check[0] *= 2;
grid_check[1] *= 2;
for (var i = 0; i < abs(grid_check[0]) + 1; i++) {
	for (var j = 0; j < abs(grid_check[1]) + 1; j++) {
		if (i == 0 && j == 0) {
			continue;
		}
		if (in_bounds([coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j])) {
			var cell = ds_grid_get(global.room_grid, coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j);
			if (cell == 0) {
				ds_grid_set(global.room_grid, argument0.coords[0], argument0.coords[1], 0)
				argument0.coords = [coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j]
				ds_grid_set(global.room_grid, argument0.coords[0], argument0.coords[1], argument0)
				// TODO: Take more damage if you collide with projectile while being thrown?
				var hold = ds_grid_get(global.room_grid_projectile, argument0.coords[0], argument0.coords[1])
				if (hold != 0 && hold != 1) {
					ds_grid_set(global.room_grid_projectile, argument0.coords[0], argument0.coords[1], 0)
					instance_destroy(hold);
				}
				
				argument0.planned_move = [coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j];
				argument0.animation_done = false;
			} else {
				if (object_get_parent(cell.object_index) == obj_enemy) {
					cell.hp -= 1000;
					ds_grid_set(global.room_grid, argument0.coords[0], argument0.coords[1], 0)
					argument0.coords = [coords[0] + dir_sign[0]*i, coords[1] + dir_sign[1]*j]
					ds_grid_set(global.room_grid, argument0.coords[0], argument0.coords[1], argument0)
					// TODO: Take more damage if you collide with projectile while being thrown?
					var hold = ds_grid_get(global.room_grid_projectile, argument0.coords[0], argument0.coords[1])
					if (hold != 0 && hold != 1) {
						ds_grid_set(global.room_grid_projectile, argument0.coords[0], argument0.coords[1], 0)
						instance_destroy(hold);
					}
					
					argument0.planned_move = [coords[0] + dir_sign[0]*i,coords[1] + dir_sign[1]*j];
					argument0.animation_done = false;
				} else if ((i+j) == 1) {
					// If no open space at all
					argument0.hp = 0;
					ds_grid_set(global.room_grid_projectile, coords[0], coords[1], 0);
					instance_destroy();
				}
			}
		} else {
			// If not in bounds and no space then kill target
			if ((i+j) == 1) {
				// If no open space at all
				argument0.hp = 0;
				ds_grid_set(global.room_grid_projectile, coords[0], coords[1], 0);
				instance_destroy();
			}
		}
	}
}
