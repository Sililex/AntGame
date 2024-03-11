if (size <= 5) {
    sprite_index = s_food_small;
} else if (size <= 10) {
    sprite_index = s_food_medium;
} else {
    sprite_index = s_food_big;
}
draw_self();