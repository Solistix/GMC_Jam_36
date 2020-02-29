/// @description Insert description here
// You can write your code in this editor
// Player Movement and Collision
if keyboard_check_pressed(ord("W")) {
	var did_collide = check_collision(coords[0], coords[1] - 1);
	if (!did_collide) {
		move_object("UP");
	}
} else if keyboard_check_pressed(ord("A")) {
	var did_collide = check_collision(coords[0] - 1, coords[1]);
	if (!did_collide) {
		move_object("LEFT");
	}
} else if keyboard_check_pressed(ord("S")) {
	var did_collide = check_collision(coords[0], coords[1] + 1);
	if (!did_collide) {
		move_object("DOWN");
	}
} else if keyboard_check_pressed(ord("D")) {
	var did_collide = check_collision(coords[0] + 1, coords[1]);
	if (!did_collide) {
		move_object("RIGHT");
	}
}
