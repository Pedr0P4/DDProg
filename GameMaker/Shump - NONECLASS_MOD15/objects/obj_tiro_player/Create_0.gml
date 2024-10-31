destruir = function()
{
	se_destruir(obj_part_tiro);	
}

//Tamanhos iniciais do tiro
image_xscale = 3;
image_yscale = 2;

vspeed = global.tirovel;

alarm[0] = game_get_speed(gamespeed_fps) * 4;