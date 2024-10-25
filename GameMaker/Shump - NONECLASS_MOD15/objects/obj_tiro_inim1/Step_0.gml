//Se o tiro sair por baixo da room, ele se destrói
if(y > room_height + 32 or y < -32) instance_destroy();
if(x > room_width + 32 or x < -32) instance_destroy();