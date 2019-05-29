/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

timer--;

if (timer <= 0 && flag) {
	flag = false;
	killme = true;
	// rumble the camera
	global.camera_shake = true;
	// explosion
	instance_create_layer(x,y,"Compatibility_Instances_Depth_0", obj_fireBall_explode);
	// spawn hitbox
	if (hitbox == -1) hitbox = hitbox_create(64, 64, -32, -32, 15, 3, 45);
}

if (killme && hitbox == -1) then instance_destroy();