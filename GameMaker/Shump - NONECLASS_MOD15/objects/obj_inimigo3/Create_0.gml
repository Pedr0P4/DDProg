//Vida do inimigo
vida_inim = 10;

//Método de morrendo do inimigo
morrendo = function()
{
	//Se a vida do inimigo não estiver zerada, perde vida, caso contrário se destrói
	if(vida_inim > 1) vida_inim--;
	else se_destruir(obj_part_inim);
}