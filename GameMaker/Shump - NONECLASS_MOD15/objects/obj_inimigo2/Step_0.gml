maquina_de_estados();

if(estado != "Chegando" and estado != "Tiro1" and estado != "Auto-destruir") desviar();

retorna_mola(0.2)
contador_efeito_branco();

if(estado == "Auto-destruir")
{
	if(timer_branco > 0)
	{
		timer_branco--;
		image_blend = c_red;
		show_debug_message("Vermelho");
	}
	else if(!mudou)
	{
		timer_normal = espera_normal;
		mudou = true;
	}
	
	if(timer_normal > 0 and mudou)
	{
		timer_normal--;
		image_blend = c_white;
		show_debug_message("Normal");
	}
	else if(mudou)
	{
		timer_branco = espera_branco;
		mudou = false;
	}
}