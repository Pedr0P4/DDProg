/// @description Onda 3

ondas_normais(16);

if(contagem%2 != 0)
{
	repeat(2)
	{
		var _x = irandom_range(32, 256);
		var _y = irandom_range(-512, -64);
		instance_create_layer(_x, _y, "Inimigos", obj_inimigo3);
	}
}

alarm[0] = game_get_speed(gamespeed_fps)*2;