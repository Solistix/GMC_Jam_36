/// @description Insert description here
// You can write your code in this editor
draw_healthbar(20, 20, 200, 50, global.player.hp, c_black, c_red, c_lime, 0, true, true)
draw_set_colour(c_black);
var window_height = window_get_height();
draw_rectangle(75, window_height - 175, 175, window_height - 75, true);
draw_text(100, window_height - 135, global.player.weapons[global.player.equipped_weapon]);
if (global.player.weapons[global.player.equipped_weapon] == "RANGED") {
	draw_text(115, window_height - 115, global.player.arrows);
}