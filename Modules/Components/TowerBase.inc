use <TowerBase.scad>

include <TowerSlideSlot.inc>

base_tower_top_screw_location = [
    -tower_size.x / 2 + 5.0,
    tower_size.y  / 2 - 4.5,
    tower_slide_slot_inner_top + 15
];

base_tower_bearing_diameter        = 10.0;
base_tower_bearing_height          =  4.0;
base_tower_bearing_floor_thickness =  1.0;

base_tower_top_screw_inset         = 0.5;