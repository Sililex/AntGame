// Initialize
// Movement
speed = 2;
move_timer = 30 * irandom_range(1, 3); // Change direction every 1-3 seconds
random_move_dir = irandom_range(-8, 8); // move randomly
pheromone_check = true;
skipping_pheromone_check_counter = 0;
// Food
holding_food = false;
holding_food_timer = 0;
food_held = 0;

// Functions
function found_food() {
	food_held += 1;
	holding_food = true;
	holding_food_timer = 0;
	pheromone_check = false;
}

function returned_food() {
	food_held = 0;
	holding_food = false;
	holding_food_timer = 0;
	pheromone_check = true;
}

function create_food_pheromone() {
	var _placed_food_pheromone = instance_create_layer(x, y, "Instances", obj_pheromone_food);
	_placed_food_pheromone.pointing = (direction + 180) mod 360;
	_placed_food_pheromone.creator = self
}