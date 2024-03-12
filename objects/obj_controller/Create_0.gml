// Vars
right_click_enabled = true;
map_grid = ds_grid_create(2000,2000) // 8px by 8px divisions of map at 16000x16000


// Camera
cam = camera_create();
// Zooming
current_zoom = 1;
zoom_speed = 0.1; // How much the zoom changes with each wheel movement
min_zoom = 0.3; // Minimum zoom factor
max_zoom = 2.5; // Maximum zoom factor
// Panning
cam_speed = 5; // How fast the camera moves
boundary = 50; // How close the mouse must be to the edge of the screen to move the camera
camera_set_view_size(cam, view_wport[0], view_hport[0]);
view_camera[0] = cam; // Assigns the camera to the first view

// Generation
// Create nest and ant in centre of room
var _center_x = room_width / 2;
var _center_y = room_height / 2;
instance_create_layer(_center_x, _center_y, "Instances", obj_nest);
instance_create_layer(_center_x, _center_y, "Instances", obj_ant);
camera_set_view_pos(cam, _center_x - camera_get_view_width(cam)/2, _center_y - camera_get_view_height(cam)/2);

// Debug complete
show_debug_message("Room Creation Controller Finished")