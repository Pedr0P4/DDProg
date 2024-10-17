opcoes_menu = ["Jogar", "Tutorial", "Sair"];

atual = 0;
margem = 25

controla_menu = function()
{
	var _fim_array = array_length(opcoes_menu)-1;

	//Alteração do atual (navegação pelas opções)
	if(keyboard_check_pressed(vk_down) and atual < _fim_array)
	{	
		atual++;
		inicia_som(sfx_zap, false, global.volume_tiro, .1);
		margem = 0;
	}
	if(keyboard_check_pressed(vk_up) and atual > 0) 
	{
		atual--;
		inicia_som(sfx_zap, false, global.volume_tiro, .1);
		margem = 0;
	}

	margem = lerp(margem, 25, 0.1);

	//Limita o valor de atual (min = 0 ; max = tamanho de opcoes_menu - 1)
	//atual = clamp(atual, 0, _fim_array);
	
	if(keyboard_check_pressed(vk_enter))
	{
		ativa_menu();	
	}
}

ativa_menu = function()
{
	switch(atual)
	{
		//Jogar
		case 0:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_jogo;
			global.em_transicao = true;
		break;
		
		//Tutorial
		case 1:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_tutorial;
			global.em_transicao = true;
		break;
		
		//Sair
		case 2:
			game_end();
		break;
	}
}

desenha_menu = function()
{
	var _meio_tela_v = display_get_gui_height()/3;

	//Definição da fonte do texto
	draw_set_font(fnt_menu);
	var _alt_fonte = string_height("I");

	draw_set_valign(1);

	//Loop para desenhar as opções do menu
	for(var i = 0; i < array_length(opcoes_menu); i++)
	{
		//Definição da cor e a margem do texto
		var _cor = c_white;
		var _marg = 0;
		if(i == atual)
		{
			_cor = c_red;
			_marg = margem;
		}
	
		//Aplicação da cor e desenho do texto
		draw_set_color(_cor);
		var _gap = _alt_fonte * i;
		draw_text(20 + _marg, _meio_tela_v + _gap*1.2, opcoes_menu[i]);
		//Reset da cor do texto
		draw_set_color(-1);
	}

	//Reset dos sets
	draw_set_valign(0);
	draw_set_font(-1);	
}