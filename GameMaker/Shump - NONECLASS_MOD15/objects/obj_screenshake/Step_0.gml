if(grau > 0.1)
{
	//Randomiza o x e o y
	var _x = random_range(-grau, grau);	
	var _y = random_range(-grau, grau);
	//Muda a posição da viewport
	view_set_xport(view_current, _x);
	view_set_yport(view_current, _y);
}
else //Caso contrário, zera tudo
{
	grau = 0
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}

//Aproxima o grau em para 0
grau = lerp(grau, 0, 0.05);