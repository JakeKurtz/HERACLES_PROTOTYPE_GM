///@function e_state_patrol
///@arg speed

if(state_new) {
    SPEED = speed_patrol;
	image_index = 0;
}

var current_node = path_position;

// Sets the objects sprite depending on what direction it's facing.

sprite_index = walk_animations[0];

// Seeks the path that it needs to follow.
if (mp_grid_path(global.grid, path, x, y, path_get_point_x(path_patrol, 0), path_get_point_y(path_patrol, 0), 1) && can_seek) {
		steering = vector_add(steering, sb_path_pursue(path,32,1,0.5));
}

// Once it's reached the start of the path, it starts its patrol.
if (path_get_length(path)<= 32) can_seek = false;

if (can_seek = false) {
	steering = vector_add(steering, sb_path_tofro(path_patrol,15,my_path_dir,0.5));
	// Will change state to idle at each node in the path and after some time has passed.
	if (current_node != my_path_position && state_timer >= 480) {
		current_node = my_path_position;
		state_switch("Idle");
	}
}

// If the enemey spots the player, change to pursue state.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
	//velocity[1] = 0;
	//velocity[2] = 0;
	//sprite_index = spr_minotaur_taunt;
	state_switch("Pursue");	
}