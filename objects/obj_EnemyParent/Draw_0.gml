draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+24, x+shadow_width*.5, y-shadow_height*.25+24, false);

draw_self();