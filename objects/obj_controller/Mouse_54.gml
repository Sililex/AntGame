// Create an instance of o_ant at the mouse position
if right_click_enabled
{
	instance_create_layer(mouse_x, mouse_y, "Instances", obj_food);
	right_click_enabled = false;
	alarm[0] = 5
}