// player_attack(weapon)
if (argument0 == "MELEE") {
	attack_melee();
} else if (argument0 == "RANGED") {
	attack_ranged(5, 1);
} else if (argument0 == "MAGIC") {
	attack_ranged(10, 0);
	hp -= 5;
}