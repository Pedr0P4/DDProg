//Vida do inimigo
vida_inim = 10;

//Controlador de estados
estado = "chegando"

carregamento = game_get_speed(gamespeed_fps) * 2;
timer_carregamento = 0;

contagem = 0;

direcao_escolhida = false;

inicia_efeito_mola()
inicia_efeito_branco()

//Método de controle da máquina de estados (state machine)
maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
			if(y < 160) vspeed = 2;
			else estado = "carregando";
			break;
			
		case "carregando":
			vspeed = 0;
			if(timer_carregamento < carregamento) timer_carregamento++;
			else
			{
				estado = choose("atirando1", "atirando2");
				timer_carregamento = 0;
				contagem++;
			}
			break;
			
		case "atirando1":
			if(instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro1_inim3);
				_tiro.speed = 3;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
				inicia_som(sfx_zap, false, global.volume_tiro, 0.1);
			}
			
			if(contagem < 3) estado = "carregando";
			else estado = "fugindo"
			break;
			
		case "atirando2":
			var _ang = 255; //Angulação do primeiro tiro
			repeat(3)
			{
				var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro2_inim3);
				_tiro.speed = 4;
				_tiro.direction = _ang;
				_ang += 15; //Incremento no gap entre os tiros
			}
			
			inicia_som(sfx_laser2, false, global.volume_tiro, 0.1);
			
			if(contagem < 3) estado = "carregando";
			else estado = "fugindo"
			break;
			
		case "fugindo":
			if(!direcao_escolhida)
			{
				hspeed = choose(-1, 1);
				direcao_escolhida = true;
			}
			vspeed = -1;
			
			if(y < -64) instance_destroy(); //Se sair por cima, se destrói
			break;
	}
}

//Método de morrendo do inimigo
morrendo = function()
{
	//Se a vida do inimigo não estiver zerada, perde vida, caso contrário se destrói
	if(vida_inim > 1) vida_inim--;
	else 
	{
		se_destruir(obj_part_inim);
		tremer_tela(10);
		inicia_som(sfx_explosion, false, global.volume_expl, 0.1);
	}
}