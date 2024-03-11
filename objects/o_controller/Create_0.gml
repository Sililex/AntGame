// Vars
right_click_enabled = true;

// Camera
cam = camera_create();
// Zooming
currentZoom = 1;
zoomSpeed = 0.1; // How much the zoom changes with each wheel movement
minZoom = 0.5; // Minimum zoom factor
maxZoom = 2; // Maximum zoom factor
// Panning
cam_speed = 5; // How fast the camera moves
boundary = 50; // How close the mouse must be to the edge of the screen to move the camera
camera_set_view_size(cam, view_wport[0], view_hport[0]);
view_camera[0] = cam; // Assigns the camera to the first view
