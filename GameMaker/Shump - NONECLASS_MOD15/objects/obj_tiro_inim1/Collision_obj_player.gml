//Se destrói
instance_destroy();
//Cria partícula
instance_create_layer(x, y, "Particulas", obj_part_tiro);

//Dá dano no player.
other.perde_vida();