#region Variáveis
//Iniciando as variáveis
vel = 2;

//Vidas
vidas = 3;
//Escudos
escudos = 3;

//Variável do escudo do player
player_escudo = noone;

//Invencibilidade
tempo_invencivel = game_get_speed(gamespeed_fps);
timer_invencivel = 0;

//Variável da espera do tiro
espera_tiro = 10;
//Variável do timer do tiro
timer_tiro = 0;

//Level do tiro
level_tiro = 1;

//Escalas do player
inicia_efeito_mola();

//Inicia a variável para verificar se o player tomou dano
inicia_efeito_branco();
#endregion

#region Métodos
//Sistema de movimentação do player
//Método de controlar o player
controla_player = function()
{
	//Diminuindo o timer de invencibilidade se ele for maior que 0
	if(timer_invencivel > 0) timer_invencivel--;
	
	//Pegando as teclas
	var _cima, _baixo, _esqu, _dire, _atirar, _escudo;
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esqu	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dire	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	_escudo = keyboard_check_pressed(ord("E"));
	
	//Fazendo a movimentação horizontal
	var _velh = (_dire - _esqu) * vel;
	//Fazendo a movimentação vertical
	var _velv = (_baixo - _cima) * vel;
	
	//Incrementando no eixo x
	x += _velh;
	//Impedindo o player de sair pela esquerda e direita
	x = clamp(x, sprite_width/2, room_width-(sprite_width/2));
	
	//Incrementando no eixo y
	y += _velv;
	//Impedindo o player de sair por cima ou por baixo
	y = clamp(y, sprite_height/2, room_height-(sprite_height/2))
	
	//Escudo
	if(keyboard_check_pressed(ord("E"))) usa_escudo();
	//Para fazer as verificações se há escudo
	com_escudo()
	
	//Diminuindo o timer do tiro se ele for maior que 0
	if(timer_tiro > 0) timer_tiro--;
	
	//Se apertei a tecla do tiro E se o timer do tiro está zerado
	if(_atirar and timer_tiro <= 0)
	{
		efeito_mola(0.7, 1.4);
	
		//Chamada do método do tiro de acordo com o level dele.
		if(level_tiro == 1)			tiro_1();
		else if(level_tiro == 2)	tiro_2();
		else if(level_tiro == 3)	tiro_3();
		
		//Diminuindo o timer do tiro
		timer_tiro = espera_tiro;
	}
}

//Criando o método do tiro 1
tiro_1 = function()
{
	//Criando o tiro
	var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_player);
	//Definindo as propriedades do tiro
	//_tiro.vspeed = -8;
}

//Criando o método do tiro 2
tiro_2 = function()
{
	//Criando o tiro da esquerda
	var _tiro1 = instance_create_layer(x - sprite_width/4, y, "Projeteis", obj_tiro_player);
	//_tiro1.vspeed = -8;
	
	//Criando o tiro da direita
	_tiro1 = instance_create_layer(x + sprite_width/4, y, "Projeteis", obj_tiro_player);
	//_tiro1.vspeed = -8;
}

//Criando o método do tiro 3
tiro_3 = function()
{
	tiro_1();
	tiro_2();
}

//Método de ganhar level do tiro
ganha_level_tiro = function()
{
	//Aumenta o level se ele for menor de 3
	if(level_tiro < 3) level_tiro++;
}

//Método para desenhar ícone
desenha_icone = function(_spr = spr_vida_player, _reps = 1, _y = 20)
{
	//Espaço entre os ícones
	var _gap = 0;

	repeat(_reps)
	{	
		//Desenhando o ícone de vida no canto inferior esquerdo da tela
		draw_sprite_ext(_spr, 0, 20+_gap, _y, 1, 1, 0, c_white, 0.6);
		//Aumentando o gap (Espaço entre os ícones);
		_gap += 30;
	}
}

//Método para perder vida
perde_vida = function()
{
	if(timer_invencivel > 0) return;
	
	if(vidas > 1)
	{
		vidas--;
		timer_invencivel = tempo_invencivel;
		efeito_mola(1.3, 0.7);
		timer_efeito_branco(3);
	}
	else
	{
		instance_destroy();
		tremer_tela(30);
	}
}

//Método para usar escudo
usa_escudo = function()
{
	//Se o player tiver escudos e não existir um escudo nele
	if(escudos > 0 and player_escudo == noone)
	{
		//Perde um escudo e desenha ele na posição do player
		escudos--;
		player_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
	}
}

//Método para fazer o controle do escudo
com_escudo = function()
{
	//Se existir um escudo (player_escudo)
	if(instance_exists(player_escudo))
	{
		//O escudo segue a posição do player
		player_escudo.x = x;
		player_escudo.y = y;
	
		//Deixa o player invencível
		timer_invencivel = tempo_invencivel;
	}
	else
	{
		player_escudo = noone;	
	}	
}
#endregion