/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("R")) {
	var path = get_shortest_path(coords, global.player.coords);
	var grid_x = path[|1] mod global.grid_width;
	var grid_y = floor(path[|1] / global.grid_width);
	var did_collide = check_collision(grid_x, grid_y);
	
	//show_debug_message(grid_x);
	//show_debug_message(grid_y);
	//show_debug_message(path[|1]);
	
	if (!did_collide) {
		if (coords[0] == grid_x && coords[1] - 1 == grid_y){
			show_debug_message(get_grid_index(coords[0],coords[1]));
			move_object("UP");
			show_debug_message(get_grid_index(coords[0],coords[1]));
		} else if (coords[0] == grid_x && coords[1] + 1 == grid_y){
			move_object("DOWN");
		} else if (coords[0] - 1 == grid_x && coords[1] == grid_y){
			move_object("LEFT");
		} else if (coords[0] + 1 == grid_x && coords[1] == grid_y){
			move_object("RIGHT");
		}
	}
	ds_list_destroy(path);
}