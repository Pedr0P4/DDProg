var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

draw_set_font(fnt_menu_menor);
if(!global.em_transicao) draw_text(_gui_width-128, 20, "Pontos: " + string(global.pontos));
draw_set_font(-1);