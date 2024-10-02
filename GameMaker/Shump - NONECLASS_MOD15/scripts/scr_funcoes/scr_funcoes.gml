// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
randomize();

#region Globais
global.debug = false;
#endregion

#region Funções Globais

//Método para a destruição do objeto
function se_destruir(_particula = obj_part_tiro)
{
	instance_destroy();
	//Cria uma partícula ao se destruir
	instance_create_layer(x, y, "Particulas", _particula);
}

function tremer_tela(_grau = 0)
{
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake) if(grau < _grau) grau = _grau;	
	}
	else
	{
		var _screenshake = instance_create_layer(0, 0, "Controladores", obj_screenshake);
		_screenshake.grau = _grau;
	}
}

#endregion