include <../../Config.inc>
use <../Utils/Utils.scad>

include <TowerSlideSlot.inc>
include <GateFrontFace.inc>
include <TowerInnerSideWall.inc>
include <TowerBase.inc>

//GateBackFace();
//TowerInnerFace();
//TowerBase();
 
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
            front_tower_inner - bias,
            tower_slide_slot_inner_bottom,
            - gate_back_face_thickness - bias
        ]) linear_extrude(
            gate_back_face_thickness
            + tower_slide_slot_wall_height
            + 2 * bias
        ) square([
            tower_slide_slot_inner_outerside
            - front_tower_inner + bias,
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
            tower_slide_slot_wall_thickness
        ) square([
            tower_slide_slot_wall_height
            + tower_inner_face_thickness * 1.1,
            tower_slide_slot_inner_top
            - tower_slide_slot_inner_bottom
        ]);
        translate([
            side_tower_inner - side_tower_center,
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
module TowerSlideSlotTowerBaseInnerTowerInner(tower_inner_wall_inner) {
    width = 2.0;
    difference() {
        union() {
            children();
            Gap();
        }
        RotLoc() 
        rotate(-90, [1,0,0])
        mirror_copy([0,0,1])
        translate([0, 0, tower_slide_slot_inner_length / 2])
        linear_extrude(.5) square(width, true);
        
    }
    
    module Gap() {
        RotLoc() {
            translate([0,0,-width]) linear_extrude(3 * width)
            square(
                [
                    width,
                    tower_slide_slot_inner_length
                ],
                center = true
            );
        }
    }
    
    module RotLoc() {
        translate([
            -tower_inner_wall_inner.x,
            -tower_inner_wall_inner.y,
            (tower_slide_slot_inner_top 
             + tower_slide_slot_inner_bottom) / 2
        ]) {
            rotate(-45, [0, 0, 1]) rotate(90, [1, 0, 0]) {
                children();
            }
        }
    }
}