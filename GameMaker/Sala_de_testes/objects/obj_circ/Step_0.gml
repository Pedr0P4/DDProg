tempo += 0.1
if(mouse_check_button_released(mb_left))
{
	_tiro = instance_create_layer(mouse_x, mouse_y, "Instances", obj_tirinho);
}
image_xscale = cos(tempo);