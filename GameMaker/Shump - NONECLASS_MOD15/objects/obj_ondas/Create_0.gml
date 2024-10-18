ondas = [sq_onda1, sq_onda1b, sq_onda2, sq_onda3];
//Indice do array "ondas"
em_onda = false;

seq_atual = noone;
seq_anterior = noone;
contagem = 0;

global.pausa_onda = true;
global.onda_atual = 1;
global.seq_atual = sq_1;

cria_sequencia = function(_sequence)
{
	layer_sequence_create("Indica_onda", room_width/2, room_height/2, _sequence);	
}

reset_vars = function()
{
	seq_atual = noone;
	seq_anterior = noone;
	contagem = 0;
}

//Sistema de ondas dos inimigos convencionais
ondas_normais = function(_reps)
{
	if(contagem == _reps)
	{
		global.onda_atual++;
		global.pausa_onda = true;
		reset_vars();
		exit;
	}

	while(seq_anterior == seq_atual)
	{
		if(seq_anterior == sq_onda1 or seq_anterior == sq_onda1b) seq_atual = choose(sq_onda2, sq_onda3);
		else seq_atual = choose(sq_onda1, sq_onda1b, sq_onda2, sq_onda3);
	}

	seq_anterior = seq_atual;

	layer_sequence_create("Ondas", 0, 0, seq_atual);
	contagem++;	
}