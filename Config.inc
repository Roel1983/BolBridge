tower_size               = [ 23.3,  23.3, 110.0];
tower_distance           = [140.0, 320.0];
tower_roof_angle         =  10.0;
shortbeam_height         =  30.0;
longbeam_width           =  20.0;
longbeam_height          =  20.0;
tower_roof_overhang      =   1.0;

beam_roof_thickness      = 0.5;
beam_roof_overhang       = 1.0;

tower_base_plinth_thickness = 0.8;
tower_base_plinth_height    = 3.0;
tower_base_plate_size       = [30, 30];
tower_base_plate_thickness  = 0.5;
tower_base_plate_feet       = [4.0, 1.0];
tower_base_plate_overhang   = 0.2;
tower_base_plate_overhang_angle = 45;

bearing_10x4_diameter       = 10.05;
bearing_10x4_height         =  4.0;

spindle_center_to_outer_wall = 7.0;

height_shortbeam_top     = 105.0;
height_shortbeam_bottom  = height_shortbeam_top - shortbeam_height;
height_longbeam_top      = 107.0;
height_longbeam_bottom   = height_longbeam_top - longbeam_height;
height_tower_side_top    = tower_size.z;
height_tower_center_top  = tower_size.z
                         + tan(tower_roof_angle)
                         * (tower_size.x) / 2;
height_tower_bottom      = tower_base_plate_feet[1] 
                         + tower_base_plate_thickness 
                         + tower_base_plinth_height - 2.0;

front_tower_inner        = (tower_distance.x - tower_size.x) / 2;
front_tower_center       = tower_distance.x / 2;
front_tower_outer        = (tower_distance.x + tower_size.x) / 2;
front_spindle_center     = front_tower_inner + spindle_center_to_outer_wall;

longbeam_inner           = (tower_distance.x - longbeam_width) / 2;
longbeam_center          = tower_distance.x / 2;
longbeam_outer           = (tower_distance.x + longbeam_width) / 2;

side_tower_inner         = (tower_distance.y - tower_size.y) / 2;
side_tower_center        = tower_distance.y / 2;
side_tower_outer         = (tower_distance.y + tower_size.y) / 2;
side_spindle_center      = side_tower_inner + spindle_center_to_outer_wall;

animate_explode = false;
animate_lift    = true;

explode  = ($t * 10) * (animate_explode?1:0);
position = abs(((($t * 2) + 1) % 2) - 1) * (animate_lift?1:0);