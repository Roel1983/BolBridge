tower_size               = [ 20.0,  20.0, 100.0];
tower_distance           = [100.0, 200.0];
tower_roof_angle         = 10.0;
height_beam_top          = 95.0;
shortbeam_height         = 30.0;
longbeam_height          = 20.0;
tower_roof_overhang      =  1.0;

height_shortbeam_top     = height_beam_top;
height_shortbeam_bottom  = height_beam_top - shortbeam_height;
height_longbeam_top      = height_beam_top;
height_longbeam_bottom   = height_beam_top - longbeam_height;
height_tower_side_top    = tower_size.z;
height_tower_center_top  = tower_size.z
                         + tan(tower_roof_angle)
                         * (tower_size.x) / 2;
height_tower_bottom      = 0.0;
front_tower_inner        = (tower_distance.x - tower_size.x) / 2;
front_tower_center       = tower_distance.x / 2;
front_tower_outer        = (tower_distance.x + tower_size.x) / 2;
side_tower_inner         = (tower_distance.y - tower_size.y) / 2;
side_tower_center        = tower_distance.y / 2;
side_tower_outer         = (tower_distance.y + tower_size.y) / 2;
