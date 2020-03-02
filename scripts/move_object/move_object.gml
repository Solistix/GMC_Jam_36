// move_object(direction)
// Top Level Variables:
//	room_grid (Global)
//  coords (Step)

var dir = argument[0];
	
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

planned_move = [coords[0], coords[1]];

