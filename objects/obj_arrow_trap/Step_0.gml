/// @description Insert description here
// You can write your code in this editor
if (global.state = "TRAP TURN") {
	attack_counter--;
	if (attack_counter <= 0) {
		attack_ranged(5, 0);
		attack_counter = initial_attack_counter;
	}
}