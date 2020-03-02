// check_collision(x,y)
// Checks if the grid region is empty for collision

// Check for out of bounds first
if (in_bounds([argument0, argument1])) {
	var result = ds_grid_get(global.room_grid, argument0, argument1);
	// Special Case
	var result_spike_ball = ds_grid_get(global.room_grid_projectile, argument0, argument1);
	if (result_spike_ball != 0 && result_spike_ball != 1) {
		if (result_spike_ball.object_index == spike_ball) return 1;
	}
	return result;
} else {
	return 1
}