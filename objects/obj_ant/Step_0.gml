if (pheromone_check)
{
	// Find the nearest o_pheromone instance
	var _nearest_pheromone = instance_nearest(x, y, obj_pheromone_basic);

	// Check if a pheromone was found
	if (_nearest_pheromone != noone)
	{
	    // Calculate the direction towards the nearest pheromone
	    var _direction_to_point = point_direction(x, y, _nearest_pheromone.x, _nearest_pheromone.y);

	    // Set the ant's direction to face towards the pheromone
	    image_angle = _direction_to_point; // This makes the ant "look" at the pheromone

	    // Optionally, set the actual movement direction towards the pheromone
	    direction = _direction_to_point; // This line is crucial for movement

	    // Set the ant's speed (change '2' to any value you find appropriate for your game)
	    speed = 2;
		
		// Stop searching for a bit
		pheromone_check = false
	}
	else
	{
		// No pheromones are present, find one
		move_timer -= 1;
		direction += random_move_dir; // Randomly adjust direction to simulate wandering
		image_angle += random_move_dir; // This makes the ant "look" where its going
		// When the timer runs out, choose a new random direction and reset the timer
		if (move_timer <= 0) {
			random_move_dir = irandom_range(-8, 8); // Move randomly again
			move_timer = 30 * irandom_range(1, 3); // Reset timer
		}
	}
}
else if (!holding_food)
{
	skipping_pheromone_check_counter += 1;
	if (skipping_pheromone_check_counter > 30)
	{
		skipping_pheromone_check_counter = 0;
		pheromone_check = true;
	}
}
else if (holding_food)
{
	// Increment holding food timer
	holding_food_timer += 1;
	
	// If held for 15, create pheromone trail
	if holding_food_timer > 15
	{
		create_food_pheromone();
		holding_food_timer = 0;
	}

	// Find the nearest o_nest_entry instance
	var _nearest_nest = instance_nearest(x, y, obj_nest_entry);

	// Check if a o_nest_entry was found
	if (_nearest_nest != noone)
	{
	    // Calculate the direction towards the nearest pheromone
	    var _direction_to_point = point_direction(x, y, _nearest_nest.x, _nearest_nest.y);

	    // Set the ant's direction to face towards the pheromone
	    image_angle = _direction_to_point; // This makes the ant "look" at the pheromone

	    // Optionally, set the actual movement direction towards the pheromone
	    direction = _direction_to_point; // This line is crucial for movement

	    // Set the ant's speed (change '2' to any value you find appropriate for your game)
	    speed = 2;
		
	}
}