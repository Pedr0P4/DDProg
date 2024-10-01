//Vida do inimigo
vida_inim = 10;

//Controlador de estados
estado = "chegando"

//Método de controle da máquina de estados (state machine)
maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if(y < 160) vspeed = 3;
			else show_debug_message("Cheguei");
		}
	}
}

//Método de morrendo do inimigo
morrendo = function()
{
	//Se a vida do inimigo não estiver zerada, perde vida, caso contrário se destrói
	if(vida_inim > 1) vida_inim--;
	else se_destruir(obj_part_inim);
}