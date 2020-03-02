/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(global.key_end_turn) && global.state == "PLAYER TURN") {
	// Player animation needs to occur on after player action
	global.player.action_counter = 0;
	global.state = "ENEMY TURN";
} else if (global.state == "ENEMY TURN") {
	global.state = "ENEMY ANIMATION";
} else if (global.state == "ENEMY ANIMATION") {
	// TODO: Set an alarm here to account for animation time?
	global.state = "TRAP TURN";
} else if (global.state == "TRAP TURN") {
	global.state = "TRAP ANIMATION";
} else if (global.state == "TRAP ANIMATION") {
	// TODO: Set an alarm here to account for animation time?
	global.state = "PLAYER TURN";
} else if (global.state == "PLAYER ANIMATION") {
	// TODO: Set an alarm here to account for animation time?
	global.state = "PLAYER TURN"; // Goes from player turn to animation back to turn
}