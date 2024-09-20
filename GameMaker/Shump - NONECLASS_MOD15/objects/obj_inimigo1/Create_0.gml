//Inicia o alarm para dar um tiro
alarm[0] = game_get_speed(gamespeed_fps) * 2;

//Método para atirar
atirar = function()
{
	//Criando o tiro
	var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inim1);
	//Editando a velocidade vertical do tiro
	_tiro.vspeed = 4;
}