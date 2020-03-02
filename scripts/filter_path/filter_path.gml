// filter_path(grid_index)
var result = ds_grid_get(global.room_grid, argument0 mod global.grid_width, floor(argument0/global.grid_width));
var result_trigger = ds_grid_get(global.room_grid_trigger, argument0 mod global.grid_width, floor(argument0/global.grid_width));
// result_trigger holds either a spike trap

if (result == 1 || result_trigger != 0) {
	// Enemies will not willingly walk into a damaging cell
	return 0; // Detects a wall so this is not a valid connection
} else return 1;