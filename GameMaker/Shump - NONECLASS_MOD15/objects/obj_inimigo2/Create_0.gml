vida_inim = 25;

espera_carregamento = game_get_speed(gamespeed_fps);
timer_carregamento = 0;

espera_segue1 = 120;
timer_segue1 = 0;

espera_segue2 = 120;
timer_segue2 = 0;

espera_gap_tiros = 20;
timer_gap_tiros = 0;
contador_tiros = 0;
contador_max = 10;

tiros_criados = false;
movendo1 = false;
movendo2 = false;

estado = "Chegando";

tiro1 = noone;
tiro2 = noone;

direita = false;
esquerda = false;
primeiro_lado = choose("direita", "esquerda")
if(primeiro_lado == "direita") direita = true;
else esquerda = true;

vel_giro = 0;

piscadas = 0;
espera_cor = 10;
timer_cor = 10;
espera_normal = 10;
timer_normal = 0;
mudou = false;

inicia_efeito_mola()
inicia_efeito_branco()

/*
Checklist:
* Quando explodir, vai soltar um arco de tiros.
* 
*/

maquina_de_estados = function()
{
	switch(estado)
	{
		case "Chegando":
			if(y < 120) vspeed = 3;
			else
			{
				vspeed = 0;
				estado = "Carregando";
				timer_carregamento = espera_carregamento;
			}
			break;
			
		case "Carregando":
			if(timer_carregamento > 0) timer_carregamento--;
			else
			{
				show_debug_message("Carregou!");
				timer_segue1 = espera_segue1;
				timer_segue2 = espera_segue2;
				estado = choose("Tiro1", "Tiro2");
				timer_carregamento = espera_carregamento;
			}
			break;
			
			case "Tiro1":
				if(!tiros_criados)
				{
					tiro1 = instance_create_layer(x, y, "Projeteis", obj_tiro_inim2);
					tiro2 = instance_create_layer(x, y, "Projeteis", obj_tiro_inim2);
					tiros_criados = true;
				}
				
				var _tiro1pos = x+sprite_width/2+16;
				var _tiro2pos = x-sprite_width/2-16;
				
				if(instance_exists(tiro1) and tiros_criados)
				{
					if(tiro1.x < _tiro1pos-1 and !movendo1)
					{
						tiro1.x = lerp(tiro1.x, _tiro1pos, 0.05);
						tiro1.image_speed = 0;
					}
					else
					{
						tiro1.image_speed = 1;
						tiro1.speed = 3;
						if(instance_exists(obj_player) and timer_segue1 > 0) tiro1.direction = point_direction(tiro1.x, tiro1.y, obj_player.x, obj_player.y);
						else tiro1.direction = 0
						tiro1.image_angle = tiro1.direction+90;
						if(timer_segue1 > 0) timer_segue1--;
					}
					
					if(tiro1.x > _tiro1pos-1) movendo1 = true;
				}
				else timer_segue1 = 0;
				
				if(instance_exists(tiro2) and tiros_criados)
				{
					if(tiro2.x > _tiro2pos+1 and !movendo2)
					{
						tiro2.x = lerp(tiro2.x, _tiro2pos, 0.05);
						tiro2.image_speed = 0;
					}
					else
					{
						tiro2.image_speed = 1;
						tiro2.speed = 3;
						if(instance_exists(obj_player) and timer_segue2 > 0) tiro2.direction = point_direction(tiro2.x, tiro2.y, obj_player.x, obj_player.y);
						else tiro2.direction = 0;
						tiro2.image_angle = tiro2.direction+90;
						if(timer_segue2 > 0) timer_segue2--;
					}
					
					if(tiro2.x < _tiro2pos+1) movendo2 = true;
				}
				else timer_segue2 = 0;
				
				//show_debug_message("Timer1: " + string(timer_segue1))
				//show_debug_message("Timer2: " + string(timer_segue2));
				
				if(timer_segue1 <= 0 and timer_segue2 <= 0)
				{
					show_debug_message("timers de tiro acabaram!");
					movendo1 = false;
					movendo2 = false;
					tiro1 = noone;
					tiro2 = noone;
					tiros_criados = false;
					estado = "Carregando";
				}
				break;
				
				case "Tiro2":
					if(timer_gap_tiros > 0) timer_gap_tiros--;
					else
					{
						var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inim2);
						_tiro.speed = 4;
						if(instance_exists(obj_player)) _tiro.direction = point_direction(x, y, obj_player.x, obj_player.y);
						else _tiro.direction = 0;
						_tiro.image_angle = _tiro.direction+90;
						timer_gap_tiros = espera_gap_tiros;
						contador_tiros++;
					}
					
					if(contador_tiros == contador_max)
					{
						timer_gap_tiros = 0;
						contador_tiros = 0;
						estado = "Carregando";
					}
					break;
					
				case "Auto-destruir":
					image_angle += vel_giro;
					break;
	}
}

//Método de morrendo do inimigo
morrendo = function()
{
	//Se a vida do inimigo não estiver zerada, perde vida, caso contrário se destrói
	if(vida_inim > 1) vida_inim--;
	else estado = "Auto-destruir";
}

desviar = function()
{
	if(direita and x > 65) x = lerp(x, 64, 0.05);
	else
	{
		direita = false;
		esquerda = true;
	}
	
	if(esquerda and x < room_width-65) x = lerp(x, room_width-64, 0.05);
	else
	{
		direita = true;
		esquerda = false;
	}
}