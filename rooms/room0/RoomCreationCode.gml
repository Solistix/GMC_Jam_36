// Create DS List

// Initialise Grid
global.grid_height = 10;
global.grid_width = 10;
global.room_grid = ds_grid_create(global.grid_width, global.grid_height);
global.grid_cell_size = 32;

// Set Player Instance
var player = instance_create_layer(0, 0, "Instances", obj_player);
player.coords = [0,0]
ds_grid_set(global.room_grid, 0, 0, player);

// Set Wall Instances
instance_create_layer(5 * global.grid_cell_size, 5 * global.grid_cell_size, "Instances", obj_wall);
ds_grid_set(global.room_grid, 5, 5, 1); // Walls don't move so just set as 1 for occupied


