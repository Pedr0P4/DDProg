//Faz o player QUE COLIDIU ganhar level
other.ganha_level_tiro();

//Destrói a instancia
instance_destroy();
instance_create_layer(x, y, "Particulas", obj_part_pu);

inicia_som(sfx_twoTone, false, 1, 0.1);