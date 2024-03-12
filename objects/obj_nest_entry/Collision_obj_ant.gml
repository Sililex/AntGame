if (other.holding_food)
{
	nest_food_counter += other.food_held
	if (nest_food_counter > 10)
	{
		instance_create_layer(x, y, "Instances", obj_ant);
	}
	other.returned_food()
}