//Se a animação estiver invertida E o frame atual for menor que 0.2, o escudo se destrói
if(image_speed < 0 and image_index < 0.2) instance_destroy();