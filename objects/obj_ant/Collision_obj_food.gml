if (!holding_food)
{
	found_food()
	other.size += -1;
	if other.size <= 0
	{
		instance_destroy(other.id)
	}
}