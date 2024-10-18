//Faz o player QUE COLIDIU ganhar level
other.ganha_escudo();

//Destrói a instancia
se_destruir(obj_part_pu);

inicia_som(sfx_twoTone, false, global.volume_expl, 0.1);