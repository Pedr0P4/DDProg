if(global.pausa_onda)
{	
	global.pausa_onda = false;
	alarm[0] = game_get_speed(gamespeed_fps)*2;
	
	switch(global.onda_atual)
	{
		case 1:
			global.seq_atual = sq_1;
		break;
	
		case 2:
			global.seq_atual = sq_2;
		break;
	
		case 3:
			global.seq_atual = sq_3;
		break;
	
		case 4:
			global.seq_atual = sq_4;
		break;
	
		case 5:
			global.seq_atual = sq_5;
		break;
		
		case 6:
			room_goto("rm_inicio");
		break;
	}
	
	cria_sequencia(global.seq_atual);
}

show_debug_message(contagem);