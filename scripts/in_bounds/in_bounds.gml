// in_bounds(coords)
if (argument0[0] < 0 || argument0[1] < 0 || argument0[0] > global.grid_width-1 || argument0[1] > global.grid_height-1 ){
	return 0;
} else return 1;