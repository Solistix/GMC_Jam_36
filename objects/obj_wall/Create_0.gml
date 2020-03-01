/// @description Insert description here
// You can write your code in this editor

// Walls don't move so just set as 1 for occupied
ds_grid_set(global.room_grid, id.x / global.grid_cell_size, id.y / global.grid_cell_size, 1);
coords=[id.x / global.grid_cell_size, id.y / global.grid_cell_size]
