//Se o indice for maior que o tamanho do array "ondas" - 1, não executa nada do alarm
if(indice > array_length(ondas)-1) exit;

//Cria a sequencia da onda
layer_sequence_create("Ondas", x, y, ondas[indice++]);

//Reseta o alarm 0 depois de 385 frames (quantidade de frames da menor sequencia)
alarm[0] = 385;