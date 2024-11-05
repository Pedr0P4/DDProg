draw_self();

var _x = cos(tempo*pi/180) * 80;
var _y = sin(tempo*pi/180) * 80;

draw_sprite(spr_tirinho, 0, x + _x, y + _y);