// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
randomize();

#region Globais
global.debug = false;
#endregion

#region Funções Globais

//Função para a destruição do objeto
function se_destruir(_particula = obj_part_tiro)
{
	instance_destroy();
	//Cria uma partícula ao se destruir
	instance_create_layer(x, y, "Particulas", _particula);
}

function tremer_tela(_grau = 0)
{
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake) if(grau < _grau) grau = _grau;	
	}
	else
	{
		var _screenshake = instance_create_layer(0, 0, "Controladores", obj_screenshake);
		_screenshake.grau = _grau;
	}
}

//Função para iniciar as escalas do objeto para o efeito mola
function inicia_efeito_mola()
{
	xscale = 1;
	yscale = 1;
}

//Função para mudar as escalas do objeto para o efeito mola
function efeito_mola(_xscale, _yscale)
{
	xscale = _xscale;
	yscale = _yscale;
}

//Função para retornar ao tamanho original do objeto
function retorna_mola(_qtd)
{
	//Mudança na escala x quando necessário
	if(xscale > 1.1 or xscale < 0.9) xscale = lerp(xscale, 1, _qtd);
	else xscale = 1;
	//Mudança na escala y quando necessário
	if(yscale > 1.1 or yscale < 0.9) yscale = lerp(yscale, 1, _qtd);
	else yscale = 1;	
}

//Função para desenhar o objeto para o efeito mola
function desenha_mola()
{
	//Desenha uma sprite do player para não mexer na colisão
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

function inicia_efeito_branco()
{
	tomou_dano = false;	
}

function timer_efeito_branco(_frames)
{
	tomou_dano = _frames;
}

function contador_efeito_branco()
{
	if(tomou_dano > 0) tomou_dano--;	
}

function desenha_efeito_branco(_funcao_desenho = draw_self)
{
	if(tomou_dano)
	{
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	}
	else
	{
		_funcao_desenho();	
	}
}

function inicia_som(_sound, _loop = 1, _volume = 1, _picth_variation = 0.1)
{
	var _pitch = random_range(1-_picth_variation, 1+_picth_variation);
	audio_play_sound(_sound, 0, _loop, _volume, , _pitch);
}

#endregion