sumindo = false;

vis = true;
invis = false;

crescendo = true;
diminuindo = false;

alarm[0] = game_get_speed(gamespeed_fps)*6;

pulsar = function()
{
	if(crescendo)
	{
		image_xscale = lerp(image_xscale, 0.8, 0.05);
		image_yscale = lerp(image_yscale, 0.8, 0.05);
	}
	
	if(diminuindo)
	{
		image_xscale = lerp(image_xscale, 1.2, 0.05);
		image_yscale = lerp(image_yscale, 1.2, 0.05);
	}
	
	if(image_xscale > 1.1 and image_yscale > 1.1)
	{
		crescendo = true;
		diminuindo = false;
	}
	else if(image_xscale < 0.9 and image_yscale < 0.9)
	{
		crescendo = false;
		diminuindo = true;
	}
}

acabando = function()
{
	if(vis) image_alpha = lerp(image_alpha, 0.5, 0.1);
	if(invis) image_alpha = lerp(image_alpha, 1, 0.1);
	
	if(image_alpha > 0.9)
	{
		vis = true;
		invis = false;
	}
	else if(image_alpha < 0.6)
	{
		vis = false;
		invis = true;
	}
}