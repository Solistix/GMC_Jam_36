// get_heuristic_value(index0, index1)
var x_offset = abs((argument0 mod global.grid_width) - (argument1 mod global.grid_width));
var y_offset = abs(floor(argument0 / global.grid_width) - floor(argument1 / global.grid_width));

return x_offset + y_offset;