// get_direction_cartesian(dir_string)
if (argument0 == "UP") {
	return [0, -1];
} else if (argument0 == "DOWN") {
	return [0, 1];
} else if (argument0 == "LEFT") {
	return [-1, 0];
} else if (argument0 == "RIGHT") {
	return [+1, 0];
}