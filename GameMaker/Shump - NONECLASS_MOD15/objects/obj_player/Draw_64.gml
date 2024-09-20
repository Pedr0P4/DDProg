if(global.debug)
{
	//Escreve um texto com o level atual do tiro
	draw_text(20, 20, "Level do tiro: " + string(level_tiro));
}

//Altura do display
var _gui_height = display_get_gui_height();

//Chamando o método para desenhar os ícones
desenha_icone(spr_vida_icon, vidas, _gui_height-50);
desenha_icone(spr_escudo_icon, escudos, _gui_height-30);