// filter_path(grid_index)
var result = ds_grid_get(global.room_grid, argument0 mod global.grid_width, floor(argument0/global.grid_width));
if (result == 1) {
	return 0; // Detects a wall so this is not a valid connection
} else return 1;