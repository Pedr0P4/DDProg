//Inicia o alarm para dar um tiro
alarm[0] = game_get_speed(gamespeed_fps) * 2;

criado_em_sequencia = in_sequence;

//Método para atirar
atirar = function()
{
	//Criando o tiro
	var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inim1);
	//Editando a velocidade vertical do tiro
	_tiro.vspeed = 4;
	
	inicia_som(sfx_laser2, 0, global.volume_tiro, 0.1);
}

morrendo = function()
{
	se_destruir(obj_part_inim);
	
	//Define uma chance do inimigo dropar um powerup (1% nesse caso)
	var _chance = irandom(100);
	if(_chance > 99) instance_create_layer(x, y, "PowerUps", choose(obj_powerup, obj_shotspeedup));
	else if(_chance > 95) instance_create_layer(x, y, "PowerUps", choose(obj_lifeup, obj_shieldup));
	else if(_chance > 90) instance_create_layer(x, y, "PowerUps", obj_velup);
	
	inicia_som(sfx_explosion, false, global.volume_expl, 0.1);
}