/// @description Insert description here
// You can write your code in this editor

// Destroys enemy if hp is 0 and below
if (hp <= 0) {
	ds_grid_set(global.room_grid, coords[0], coords[1], 0);
	instance_destroy();
}

if global.state == "ENEMY TURN" {
	var path = get_shortest_path(coords, global.player.coords);
	var grid_x = path[|1] mod global.grid_width;
	var grid_y = floor(path[|1] / global.grid_width);
	var did_collide = check_collision(grid_x, grid_y);
	
	if (!did_collide) {
		if (coords[0] == grid_x && coords[1] - 1 == grid_y){
			move_object("UP");
		} else if (coords[0] == grid_x && coords[1] + 1 == grid_y){
			move_object("DOWN");
		} else if (coords[0] - 1 == grid_x && coords[1] == grid_y){
			move_object("LEFT");
		} else if (coords[0] + 1 == grid_x && coords[1] == grid_y){
			move_object("RIGHT");
		}
	} else if(did_collide != 1 && did_collide.object_index == obj_player) {
		global.player.hp -= attack;
	}
	ds_list_destroy(path);
}