if (grow_step == false && irandom_range(0, 120) == 0)
{
	grow_step = true;
}

if (grow_step)
{
	if size < 15
	{
		size += 1;
	}
	else
	{
		instance_create_layer(x + irandom_range(-32,32), y + irandom_range(-32,32), "Instances", obj_food);
	}
	grow_step = false;
}