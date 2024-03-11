// Camera setup variables
var mouseX = device_mouse_x_to_gui(0); // Convert mouse x to GUI coordinates
var mouseY = device_mouse_y_to_gui(0); // Convert mouse y to GUI coordinates
var viewX = camera_get_view_x(cam);
var viewY = camera_get_view_y(cam);
var viewW = camera_get_view_width(cam);
var viewH = camera_get_view_height(cam);
var roomW = room_width;
var roomH = room_height;

// Zooming logic
if mouse_wheel_down() { // Zoom out
    currentZoom -= zoomSpeed;
} else if mouse_wheel_up() { // Zoom in
    currentZoom += zoomSpeed;
}
currentZoom = clamp(currentZoom, minZoom, maxZoom); // Clamp zoom level

// Calculate mouse position in world coordinates before zooming
var worldMouseX = viewX + (mouseX / view_wport[0]) * viewW;
var worldMouseY = viewY + (mouseY / view_hport[0]) * viewH;

// Update view size based on current zoom level
var newWidth = view_wport[0] / currentZoom;
var newHeight = view_hport[0] / currentZoom;

// Set the new view size
camera_set_view_size(cam, newWidth, newHeight);

// Update view dimensions to calculate the new camera position for zoom centering
viewW = newWidth;
viewH = newHeight;

// Calculate new camera position to maintain zoom centering on mouse cursor
var newX = worldMouseX - (mouseX / view_wport[0]) * viewW;
var newY = worldMouseY - (mouseY / view_hport[0]) * viewH;

// Panning logic
// Adjust newX and newY based on keyboard input
newX += (keyboard_check(vk_right) - keyboard_check(vk_left)) * cam_speed * 1/currentZoom;
newY += (keyboard_check(vk_down) - keyboard_check(vk_up)) * cam_speed * 1/currentZoom;

// Mouse-based panning adjustments
if (mouseX > view_wport[0] - boundary) { newX += cam_speed * 1/currentZoom; } // Pan right
if (mouseX < boundary) { newX -= cam_speed * 1/currentZoom; } // Pan left
if (mouseY > view_hport[0] - boundary) { newY += cam_speed * 1/currentZoom; } // Pan down
if (mouseY < boundary) { newY -= cam_speed * 1/currentZoom; } // Pan up

// Clamp camera position to room bounds to avoid showing outside the room
newX = clamp(newX, 0, roomW - viewW);
newY = clamp(newY, 0, roomH - viewH);

// Apply the new camera position
camera_set_view_pos(cam, newX, newY);
