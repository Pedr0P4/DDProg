if(y <= -64) instance_destroy();

//Aproxima os tamanhos do tiro para 1 (tamanho original)
image_xscale = lerp(image_xscale, 1, 0.35);
image_yscale = lerp(image_yscale, 1, 0.35);

//Aproxima a velocidade vertical de -10 gradativamente
vspeed = lerp(vspeed, -10, 0.1);