maquina_de_estados();

if(estado != "Chegando" and estado != "Tiro1" and estado != "Auto-destruir") desviar();

retorna_mola(0.2)
contador_efeito_branco();

if(estado == "Auto-destruir")
{
	if(timer_cor > 0)
	{
		timer_cor--;
		image_blend = c_red;
		show_debug_message("Vermelho");
	}
	else if(!mudou)
	{
		timer_normal = espera_normal;
		mudou = true;
	}
	
	if(timer_normal > 0 and mudou)
	{
		timer_normal--;
		image_blend = c_white;
		show_debug_message("Normal");
	}
	else if(mudou)
	{
		timer_cor = espera_cor;
		piscadas++;
		mudou = false;
	}
	
	if(piscadas < 5)
	{
		espera_cor = 10;
		espera_normal = 10;
		vel_giro = 5;
	}
	else if(piscadas < 10)
	{
		espera_cor = 7;
		espera_normal = 7;
		vel_giro = 10;
	}
	else if(piscadas < 15)
	{
		espera_cor = 5;
		espera_normal = 5;
		vel_giro = 20;
	}
	
	if(piscadas >= 20)
	{
		se_destruir(obj_part_inim);
		tremer_tela(10);
		inicia_som(sfx_explosion, false, global.volume_expl, 0.1);
		//Define uma chance do inimigo dropar um powerup (5% nesse caso)
		var _chance = random(100);
		if(_chance > 70) instance_create_layer(x, y, "PowerUps", choose(obj_powerup, obj_shotspeedup));
		else if(_chance > 65) instance_create_layer(x, y, "PowerUps", obj_velup);
		else if(_chance > 60) instance_create_layer(x, y, "PowerUps", choose(obj_lifeup, obj_shieldup));
		
		var _dir = 0;
		var _rep = 16;
		repeat(_rep)
		{
			var _gap = 360/_rep;
			var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inim2);
			_tiro.direction = _dir;
			_tiro.image_angle = _tiro.direction+90;
			_tiro.speed = 6;
			_dir += _gap;
		}
	}
	
	show_debug_message(piscadas);
}