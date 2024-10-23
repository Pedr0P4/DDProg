ondas = [sq_onda1, sq_onda1b, sq_onda2, sq_onda3];
//Indice do array "ondas"
em_onda = false;

cria_sequencia = function(_sequence)
{
	layer_sequence_create("Indica_onda", room_width/2, room_height/2, _sequence);	
}