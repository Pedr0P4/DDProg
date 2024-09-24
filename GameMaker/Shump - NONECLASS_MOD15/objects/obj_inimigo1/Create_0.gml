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
}

morrer = function()
{
	se_destruir(obj_part_inim);
	
	//Define uma chance do inimigo dropar um powerup (5% nesse caso)
	var _chance = random(100);
	if(_chance >= 95) instance_create_layer(x, y, "PowerUps", obj_powerup);
}