#region Variáveis
//Iniciando as variáveis
vel = 2;
//Variável da espera do tiro
espera_tiro = 10;
//Variável do timer do tiro
timer_tiro = 0;
#endregion

#region Movimentação
//Sistema de movimentação do player
//Método de controlar o player
controla_player = function()
{
	//Pegando as teclas
	var _cima, _baixo, _esqu, _dire, _atirar;
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esqu	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dire	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
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
	
	//Diminuindo o timer do tiro
	timer_tiro--;
	
	//Se apertei a tecla do tiro E se o timer do tiro está zerado
	if(_atirar and timer_tiro <= 0){
		//Diminuindo o timer do tiro
		timer_tiro = espera_tiro;
		
		//Criando tiro
		var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_player);
		
		//Definindo as propriedades do tiro
		_tiro.vspeed = -8;
	}
}
#endregion