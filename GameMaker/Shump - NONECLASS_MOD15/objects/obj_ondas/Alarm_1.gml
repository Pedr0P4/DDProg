var _contagem = 0;
var _anterior = noone;
var _atual = noone;

if(_contagem > 5) exit;
if(_anterior == sq_onda1 or _anterior == sq_onda1b) _atual = choose(sq_onda2, sq_onda3);
else _atual = choose(sq_onda1, sq_onda1b, sq_onda2, sq_onda3);
_anterior = _atual;

layer_sequence_create("Ondas", 0, 0, _atual);
_contagem++;

//Reseta o alarm 0 depois de 385 frames (quantidade de frames da menor sequencia)
alarm[0] = game_get_speed(gamespeed_fps)*4;