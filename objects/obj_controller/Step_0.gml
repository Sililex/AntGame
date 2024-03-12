// Camera setup variables
var _mouse_x = device_mouse_x_to_gui(0); // Convert mouse x to GUI coordinates
var _mouse_y = device_mouse_y_to_gui(0); // Convert mouse y to GUI coordinates
var _view_x = camera_get_view_x(cam);
var _view_y = camera_get_view_y(cam);
var _view_w = camera_get_view_width(cam);
var _view_h = camera_get_view_height(cam);
var _room_w = room_width;
var _room_h = room_height;

// Zooming logic
if mouse_wheel_down() { // Zoom out
    current_zoom -= zoom_speed;
} else if mouse_wheel_up() { // Zoom in
    current_zoom += zoom_speed;
}
current_zoom = clamp(current_zoom, min_zoom, max_zoom); // Clamp zoom level

// Calculate mouse position in world coordinates before zooming
var _world_mouse_x = _view_x + (_mouse_x / view_wport[0]) * _view_w;
var _world_mouse_y = _view_y + (_mouse_y / view_hport[0]) * _view_h;

// Update view size based on current zoom level
var _new_width = view_wport[0] / current_zoom;
var _new_height = view_hport[0] / current_zoom;

// Set the new view size
camera_set_view_size(cam, _new_width, _new_height);

// Update view dimensions to calculate the new camera position for zoom centering
_view_w = _new_width;
_view_h = _new_height;

// Calculate new camera position to maintain zoom centering on mouse cursor
var _new_x = _world_mouse_x - (_mouse_x / view_wport[0]) * _view_w;
var _new_y = _world_mouse_y - (_mouse_y / view_hport[0]) * _view_h;

// Panning logic
// Adjust new_x and new_y based on keyboard input
_new_x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * cam_speed * 1/current_zoom;
_new_y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * cam_speed * 1/current_zoom;

// Mouse-based panning adjustments
if (_mouse_x > view_wport[0] - boundary) { _new_x += cam_speed * 1/current_zoom; } // Pan right
if (_mouse_x < boundary) { _new_x -= cam_speed * 1/current_zoom; } // Pan left
if (_mouse_y > view_hport[0] - boundary) { _new_y += cam_speed * 1/current_zoom; } // Pan down
if (_mouse_y < boundary) { _new_y -= cam_speed * 1/current_zoom; } // Pan up

// Clamp camera position to room bounds to avoid showing outside the room
_new_x = clamp(_new_x, 0, _room_w - _view_w);
_new_y = clamp(_new_y, 0, _room_h - _view_h);

// Apply the new camera position
camera_set_view_pos(cam, _new_x, _new_y);

// If space_down, center on nearest nest
if (keyboard_check_pressed(vk_space))
{
	var _cam_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
	var _cam_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;
	var _nearest_nest = instance_nearest(_cam_x, _cam_y, obj_nest);
	if (_nearest_nest != noone) // Check if a nest is found
	{
	    _new_x = _nearest_nest.x - camera_get_view_width(cam) / 2;
	    _new_y = _nearest_nest.y - camera_get_view_height(cam) / 2;

	    // Clamp the new camera position to ensure it doesn't go outside the room bounds
	    _new_x = clamp(_new_x, 0, room_width - camera_get_view_width(cam));
	    _new_y = clamp(_new_y, 0, room_height - camera_get_view_height(cam));

	    // Move the camera to the nest
	    camera_set_view_pos(cam, _new_x, _new_y);
	}
}


