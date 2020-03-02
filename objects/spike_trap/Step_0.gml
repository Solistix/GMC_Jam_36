/// @description Insert description here
// You can write your code in this editor
target = ds_grid_get(global.room_grid, coords[0], coords[1]);
if (target != previous_target && target != 0 && target != 1) {
	target.hp -= 5;
}
previous_target = target;