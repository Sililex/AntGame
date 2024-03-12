if other.pheromone_check == false && other.holding_food == false
{
	other.pheromone_check = true;
	instance_destroy();
}