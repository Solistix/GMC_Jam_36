/// @description Insert description here
// You can write your code in this editor
if (global.state = "TRAP TURN") {
	attack_counter--;
	if (attack_counter <= 0) {
		var projectile = instance_create_layer(coords[0] * global.grid_cell_size, coords[1] * global.grid_cell_size, "Instances", spike_ball);
		projectile.is_moving = is_facing;
		attack_counter = initial_attack_counter;
	}
}