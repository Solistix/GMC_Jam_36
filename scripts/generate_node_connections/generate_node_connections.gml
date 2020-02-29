// generate_node_connections()

global.node_connections_map = ds_map_create();

for(var row = 0; row < global.grid_height; row++) {
	for(var column = 0; column < global.grid_width; column++) {
		var connections_list = ds_list_create();
		// Add connections in the four directions if it is not out of bounds
		// TODO: Check for walls and maybe instanced objects that don't move but have collision
		if (row + 1 < global.grid_width) {
			// Not in the same if statement to make sure that index exists
			ds_list_add(connections_list, get_grid_index(row + 1, column));
		}
		if (row - 1 >= 0 ) {
			ds_list_add(connections_list, get_grid_index(row - 1, column));
		}
		if (column + 1 < global.grid_height) {
			ds_list_add(connections_list, get_grid_index(row, column + 1));
		}
		if (column - 1 >= 0) {
			ds_list_add(connections_list, get_grid_index(row, column - 1));
		}
		ds_map_add_list(global.node_connections_map, get_grid_index(row, column), connections_list);
	}
}