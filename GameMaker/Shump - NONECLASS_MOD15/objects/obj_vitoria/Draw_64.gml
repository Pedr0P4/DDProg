var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

if(global.em_transicao) exit;

draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_text(_gui_width/2, _gui_height/2+_gui_height/4, "Você finalizou com\n" + string(global.pontos) + "\nde pontuação");
draw_set_halign(-1);
draw_set_font(-1)