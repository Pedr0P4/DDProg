vida_inim = 25

inicia_efeito_mola()
inicia_efeito_branco()

/*
Checklist:
* Quando explodir, vai soltar um arco de tiros.
* 
*/

//Método de morrendo do inimigo
morrendo = function()
{
	//Se a vida do inimigo não estiver zerada, perde vida, caso contrário se destrói
	if(vida_inim > 1) vida_inim--;
	else 
	{
		se_destruir(obj_part_inim);
		tremer_tela(10);
		inicia_som(sfx_explosion, false, global.volume_expl, 0.1);
		
		//Define uma chance do inimigo dropar um powerup (5% nesse caso)
		var _chance = random(100);
		if(_chance > 85) instance_create_layer(x, y, "PowerUps", choose(obj_powerup, obj_shotspeedup));
		else if(_chance > 80) instance_create_layer(x, y, "PowerUps", obj_velup);
		else if(_chance > 75) instance_create_layer(x, y, "PowerUps", choose(obj_lifeup, obj_shieldup));
	}
}