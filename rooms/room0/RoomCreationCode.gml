// Create DS List

// Initialise Grid
global.grid_height = 10;
global.grid_width = 10;
global.room_grid = ds_grid_create(global.grid_width, global.grid_height);
global.grid_cell_size = 32;

// Set Player Instance
instance_create_layer(0, 0, "Instances", obj_player);

// Set Wall Instances
instance_create_layer(5 * global.grid_cell_size, 5 * global.grid_cell_size, "Instances", obj_wall);

// Generate Node Connections for Path Finding, should be done after wall instances but before enemies
generate_node_connections();

// Set Enemy Instances
instance_create_layer(6 * global.grid_cell_size, 6 * global.grid_cell_size, "Instances", obj_enemy);
instance_create_layer(6 * global.grid_cell_size, 5 * global.grid_cell_size, "Instances", obj_enemy);
instance_create_layer(6 * global.grid_cell_size, 4 * global.grid_cell_size, "Instances", obj_enemy);
instance_create_layer(6 * global.grid_cell_size, 3 * global.grid_cell_size, "Instances", obj_enemy);