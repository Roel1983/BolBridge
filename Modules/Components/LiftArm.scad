use <../Utils/Utils.scad>
include <TowerSlideSlot.inc>
include <TowerBase.inc>
include <../SubAssemblies/Portal_Back.inc>

include <LiftArm.inc>

part = "part"; // "part", "end-situation", "fit"

if(part == "end-situation") {
    translate([
        + tower_size.x/2 - spindle_center_to_outer_wall,
        + tower_size.y/2 - spindle_center_to_outer_wall
    ])
    projection(cut = true) {
        intersection() {
            translate([-tower_distance.x/2,0, -tower_slide_slot_outer_bottom - 10]) Portal_Back();
            cube(tower_size.x * 1.5, true);
        }
    }
    LiftArm();
} else if (part == "fit") {
    translate([
        + tower_size.x/2 - spindle_center_to_outer_wall,
        + tower_size.y/2 - spindle_center_to_outer_wall
    ])
    projection(cut = true) {
        intersection() {
            translate([-tower_distance.x/2,0, -tower_slide_slot_outer_top - 10]) Portal_Back();
            cube(tower_size.x * 1.5, true);
        }
    }
    translate([6.25,6.3]) rotate(-14) LiftArm();
} else {
    LiftArm();
}


arm_pos = [
    tower_distance.x / 2 - tower_slide_slot_center - spindle_center_to_outer_wall,
    spindle_center_to_outer_wall
];

module LiftArm() {
    difference() {
        union() {
            Base();
            Arm();
        }
        translate([0, 0, lift_arm_bottom_thickness]) {
            rotate(15) NutHole();
        }
    }
    
    module Base() {
        linear_extrude(lift_arm_base_height) {
            offset(r=0.2) {
                hull() {
                    rotate(15) offset(0.6, $fn=32) Hex(7.0);
                }
            }
        }
    }
    
    module Arm() {
        translate([0, 0, lift_arm_l_bottom]) linear_extrude(lift_arm_height) {
            offset(r=0.2) {
                hull() {
                    rotate(15) offset(0.6, $fn=32) Hex(7.0);
                    translate([
                        -(3.5 / cos(30) * cos(15)) - .6,
                        -(3.5 / cos(30) * cos(15)) - .6]
                    ) {
                        square(1);
                    }
                }
                translate([
                    -spindle_center_to_outer_wall + 1 + tower_slide_slot_inner_width/2, 
                    -spindle_center_to_outer_wall + 1 + tower_slide_slot_inner_width/2
                ]) {
                    
                    rotate(180) translate([0, tower_slide_slot_inner_width/2]){
                        translate([-0.2, 0]) square([0.4, 6.8]);
                    }
                    rotate(-45) translate([0, tower_slide_slot_inner_width/2]){
                        translate([-0.2, 0]) square([0.4, 6.7]);
                    }
                    r = (tower_slide_slot_inner_width/2) / tan(45/2);
                    translate([r,-(tower_slide_slot_inner_width/2)]) {
                        intersection() {
                            difference() {
                                circle(r=r + .2, $fn=64);
                                circle(r=r - .2, $fn=64);
                            }
                            rotate(90) square(r + .2);
                            rotate(90 + 45) square(r + .2);
                        }
                    }
                }
            }
        }
    }
    
    module NutHole() {
        linear_extrude(lift_arm_nut_height) Hex(d = 7.0);
        linear_extrude(lift_arm_nut_height + 2) Hex(d = 6.95);
    }
}