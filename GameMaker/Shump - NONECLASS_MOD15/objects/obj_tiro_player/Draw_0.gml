draw_self()

//Muda como o computador processa as cores
gpu_set_blendmode(bm_add);

//Desenha a mesma sprite do tiro, só que um pouco maior e um pouco transparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*1.5, image_yscale*1.5, image_angle, image_blend, 0.3);

//Reseta o processamento das cores do computador
gpu_set_blendmode(bm_normal);