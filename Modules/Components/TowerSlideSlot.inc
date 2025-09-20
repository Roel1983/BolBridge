include <../../Config.inc>
include <TowerInnerSideWall.inc>

use <TowerSlideSlot.scad>

tower_slide_slot_wall_thickness  = 0.4;
tower_slide_slot_inner_bottom    = 15.0;
tower_slide_slot_inner_top       = 40.0;
tower_slide_slot_inner_width     =  2 * 0.4 + 2 * 0.25;
tower_slide_slot_wall_height     = 1.0;
tower_slide_slot_inner_length    = (tower_slide_slot_inner_top 
                                 - tower_slide_slot_inner_bottom);

tower_slide_slot_outer_bottom    = tower_slide_slot_inner_bottom
                                 - tower_slide_slot_wall_thickness;
tower_slide_slot_outer_top       = tower_slide_slot_inner_top
                                 + tower_slide_slot_wall_thickness;
tower_slide_slot_outer_innerside = front_tower_inner
                                 + tower_inner_face_thickness
                                 - tower_slide_slot_wall_thickness;
tower_slide_slot_inner_innerside = tower_slide_slot_outer_innerside
                                 + tower_slide_slot_wall_thickness;
tower_slide_slot_center          = tower_slide_slot_inner_innerside
                                 + tower_slide_slot_inner_width / 2;
tower_slide_slot_inner_outerside = tower_slide_slot_inner_innerside
                                 + tower_slide_slot_inner_width;
tower_slide_slot_outer_outerside = tower_slide_slot_inner_outerside
                                 + tower_slide_slot_wall_thickness;