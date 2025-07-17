include <Config.inc>
use <Utils.scad>

include <TowerSlideSlot.inc>
include <GateFrontFace.inc>
include <TowerInnerFace.inc>
include <TowerInnerFace.inc>

tower_slide_slot_wall_thickness  = tower_inner_face_thickness;
tower_slide_slot_inner_bottom    = 15.0;
tower_slide_slot_inner_top       = 40.0;
tower_slide_slot_inner_width     =  2 * 0.4 + 2 * 0.25;
tower_slide_slot_wall_height     = 1.0;

tower_slide_slot_outer_bottom    = tower_slide_slot_inner_bottom
                                 - tower_slide_slot_wall_thickness;
tower_slide_slot_outer_top       = tower_slide_slot_inner_top
                                 + tower_slide_slot_wall_thickness;
tower_slide_slot_outer_innerside = front_tower_inner;
tower_slide_slot_inner_innerside = tower_slide_slot_outer_innerside
                                 + tower_slide_slot_wall_thickness;
tower_slide_slot_center          = tower_slide_slot_inner_innerside
                                 + tower_slide_slot_inner_width / 2;
tower_slide_slot_inner_outerside = tower_slide_slot_inner_innerside
                                 + tower_slide_slot_inner_width;
tower_slide_slot_outer_outerside = tower_slide_slot_inner_outerside
                                 + tower_slide_slot_wall_thickness;

//GateBackFace();
TowerInnerFace();
 
module TowerSlideSlotGateBackFace() {
    difference() {
        union() {
            children();
            mirror_copy(
                vec = [1,0,0]
            ) linear_extrude(1) translate([
                tower_slide_slot_outer_innerside,
                tower_slide_slot_outer_bottom
            ]) square([
                tower_slide_slot_outer_outerside
                - tower_slide_slot_outer_innerside,
                tower_slide_slot_outer_top
                - tower_slide_slot_outer_bottom
            ]);
        }
        bias = 0.1;
        mirror_copy(
            [1,0,0]
        ) translate([
            tower_slide_slot_outer_innerside - bias,
            tower_slide_slot_inner_bottom,
            - gate_back_face_thickness - bias
        ]) linear_extrude(
            gate_back_face_thickness
            + tower_slide_slot_wall_height
            + 2 * bias
        ) square([
            tower_slide_slot_inner_outerside
            - tower_slide_slot_outer_innerside + bias,
            tower_slide_slot_inner_top
            - tower_slide_slot_inner_bottom
        ]);
    }
}

module TowerSlideSlotTowerInnerFace() {
    union() {
        children();
        translate([
            side_tower_inner - side_tower_center
            -tower_slide_slot_wall_height,
            tower_slide_slot_inner_bottom,
            -tower_inner_face_thickness
        ]) linear_extrude(
            tower_inner_face_thickness
        ) square([
            tower_slide_slot_wall_height
            + tower_inner_face_thickness * 1.1,
            tower_slide_slot_inner_top
            - tower_slide_slot_inner_bottom
        ]);
    }
    
}