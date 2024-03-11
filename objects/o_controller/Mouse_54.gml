// Get the mouse position
var mouseX = mouse_x;
var mouseY = mouse_y;

// Create an instance of o_ant at the mouse position
if right_click_enabled
{
	instance_create_layer(mouseX, mouseY, "Instances", o_food);
	right_click_enabled = false;
	alarm[0] = 5
}