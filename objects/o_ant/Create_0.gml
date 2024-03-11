// Initialize
// Movement
speed = 2;
pheromone_check = true;
skipping_pheromone_check_counter = 0;
// Food
holding_food = false;
holding_food_timer = 0;
food_held = 0;

// Functions
function found_food() {
	instance_create_layer(x, y, "Instances", o_pheromone);
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