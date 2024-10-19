/// @description Onda 1

//Sistema de ondas de inimigos convencionais
ondas_normais(5);

//Reseta o alarm 0 depois de 385 frames (quantidade de frames da menor sequencia)
alarm[0] = game_get_speed(gamespeed_fps)*4;