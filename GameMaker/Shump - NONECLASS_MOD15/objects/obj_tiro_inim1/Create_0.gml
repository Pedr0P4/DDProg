//Método para destruir o tiro
destruir = function()
{
	//Se destrói
	instance_destroy();
	//Cria partícula
	instance_create_layer(x, y, "Particulas", obj_part_tiro);	
}