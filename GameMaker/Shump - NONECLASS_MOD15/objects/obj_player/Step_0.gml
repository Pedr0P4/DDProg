//Chamado do método de controlar o player
controla_player();

if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug;

////Debug do level do tiro
//if(keyboard_check_pressed(ord("I"))) level_tiro++;
//if(keyboard_check_pressed(ord("K"))) level_tiro--;
////Limitando os leveis no level mínimo e máximo
//level_tiro = clamp(level_tiro, 1, 3);

//Debug de vida
if(keyboard_check_pressed(vk_enter)) perde_vida();

//Debug de escudo
if(keyboard_check_pressed(ord("E"))) usa_escudo();

//Se existir um escudo (player_escudo)
if(instance_exists(player_escudo))
{
	//O escudo segue a posição do player
	player_escudo.x = x;
	player_escudo.y = y;
}
else
{
	player_escudo = noone;	
}