/// @description Insert description here
// You can write your code in this editor
coords = [round(id.x / global.grid_cell_size), round(id.y / global.grid_cell_size)];
ds_grid_set(global.room_grid_projectile, coords[0], coords[1], id);
planned_move = 0;
animation_done=false;
is_moving = "DOWN";