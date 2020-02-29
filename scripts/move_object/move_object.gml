// move_object(direction)
// Top Level Variables:
//	room_grid (Global)
//  coords (Step)


var dir = argument0;

ds_grid_set(global.room_grid, coords[0], coords[1], 0)
if (dir == "UP") {
	ds_grid_set(global.room_grid, coords[0], --coords[1], id)
} else if (dir == "DOWN") {
	ds_grid_set(global.room_grid, coords[0], ++coords[1], id)
} else if (dir == "LEFT") {
	ds_grid_set(global.room_grid, --coords[0], coords[1], id)
} else if (dir == "RIGHT") {
	ds_grid_set(global.room_grid, ++coords[0], coords[1], id)
}

//TODO: TESTING ONLY
id.x = coords[0] * global.grid_cell_size;
id.y = coords[1] * global.grid_cell_size;