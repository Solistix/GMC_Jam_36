// check_collision(x,y)
// Checks if the grid region is empty for collision

// Check for out of bounds first
if (argument0 < global.grid_width && argument0 >= 0 && argument1 < global.grid_height && argument1 >= 0) {
	var result = ds_grid_get(global.room_grid, argument0, argument1)
	return result;
} else {
	return 1
}