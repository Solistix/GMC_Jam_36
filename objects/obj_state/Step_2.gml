/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(global.key_end_turn) && global.state == "PLAYER TURN") {
	global.player.action_counter = 0;
	global.state = "ENEMY TURN";
} else if (global.state == "ENEMY TURN") {
	global.state = "TRAP TURN";
} else if (global.state == "TRAP TURN") {
	global.player.action_counter = 0;
	global.state = "PLAYER TURN";
}