// change_equipped_weapon

if keyboard_check_pressed(global.key_switch_weapon_left) {
	if (equipped_weapon - 1 < 0) equipped_weapon = array_length_1d(weapons) - 1;
	else equipped_weapon--;
}
if keyboard_check_pressed(global.key_switch_weapon_right) {
	if (equipped_weapon + 1 >= array_length_1d(weapons)) equipped_weapon = 0;
	else equipped_weapon++;
}