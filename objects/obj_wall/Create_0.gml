/// @description Insert description here
// You can write your code in this editor

// Walls don't move so just set as 1 for occupied
x=(x div 32)*global.grid_cell_size
y=(y div 32)*global.grid_cell_size
ds_grid_set(global.room_grid, id.x / global.grid_cell_size, id.y / global.grid_cell_size, 1);
coords=[id.x / global.grid_cell_size, id.y / global.grid_cell_size]
