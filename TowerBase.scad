include <Config.inc>

include <TowerBase.inc>
include <TowerOuterFace.inc>
include <TowerInnerFace.inc>
include <GateFrontFace.inc>

use <Utils.scad>

tolerance       = 0.1;
floor_thickness = 2.0;
inner_tower_wall_thickness = 0.8;

plinth_inner_width = [
    tower_size.x + tolerance,
    tower_size.y + tolerance
];
plinth_outer_width = [
    plinth_inner_width.x + tower_base_plinth_thickness,
    plinth_inner_width.y + tower_base_plinth_thickness];

height_plate_top    = tower_base_plate_feet[1]
                    + tower_base_plate_thickness;
height_plinth_top   = height_plate_top + tower_base_plinth_height;
tower_outer_wall_inner = [
    tower_size.x / 2 - gate_front_face_thickness,
    tower_size.y / 2 - tower_outer_face_thickness
];
tower_inner_wall_inner = [
    tower_size.x / 2 - gate_back_face_thickness,
    tower_size.y / 2 - tower_inner_face_thickness
];


TowerBase();

module TowerBaseRotLoc(index = 0) {
    
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([front_tower_center,side_tower_center]) children();
        } else if (i == 1) {
            translate([-front_tower_center,side_tower_center]) children();
        } else if (i == 2) {
            translate([front_tower_center,-side_tower_center]) children();
        } else if (i == 3) {
            translate([-front_tower_center,-side_tower_center]) children();
        }
    }
}

module TowerBase() {
    Spindle() InnerTower() TowerHole() Base();
    
    module Spindle() {
        bearing_diameter = 10.0;
        bearing_height   =  4.0;
        bearing_floor_thickness = 1.0;
        bearing_wall     =  1.6;
        bearing_top_rim_height = 1.0;
        difference() {
            union() {
                children();
                SpindleLoc() {
                    cylinder(
                        d   = bearing_diameter + bearing_wall,
                        h   = bearing_floor_thickness + bearing_height
                            + bearing_top_rim_height,
                        $fn = 64);
                }
            }
            SpindleLoc() {
                bias = 0.1;
                bottom_rim = 1.0;
                top_rim    = 0.2;
                
                translate([0, 0, bearing_floor_thickness]) cylinder(
                    d = bearing_diameter,
                    h = bearing_height,
                    $fn = 64);
                translate([0, 0, -bias]) cylinder(
                    d = bearing_diameter - 2 * bottom_rim,
                    h = bearing_floor_thickness + 2 * bias,
                    $fn = 64);
                translate([0, 0, bearing_floor_thickness]) cylinder(
                    d = bearing_diameter - 2 * top_rim,
                    h = bearing_height + bearing_top_rim_height + bias,
                    $fn = 64);
            }
        }
        
        module SpindleLoc() {
            translate([
                - tower_size.x/2 + spindle_center_to_outer_wall,
                - tower_size.y/2 + spindle_center_to_outer_wall
            ]) children();
        }
    }

    module InnerTower() {
        chamfer = 2;
        height  = 20;
        
        difference() {
            union() {
                children();
                linear_extrude(height_plinth_top + height) {
                    offset(delta=chamfer, chamfer = true) offset(-chamfer) InnerTowerProfile();
                }
            }
            translate([0,0,floor_thickness]) {
                linear_extrude(height_plinth_top + height) {
                    offset(delta=chamfer - inner_tower_wall_thickness, chamfer = true) {
                        offset(-chamfer) InnerTowerProfile();
                    }
                }
            }
        }

        module InnerTowerProfile() {
            polygon([
                [
                    -tower_inner_wall_inner.x,
                    -tower_inner_wall_inner.y
                ] , [
                    -tower_inner_wall_inner.x,
                    tower_outer_wall_inner.y
                ], [
                    tower_outer_wall_inner.x,
                    tower_outer_wall_inner.y
                ], [
                    tower_outer_wall_inner.x,,
                    -tower_inner_wall_inner.y
                ]
            ]);
        }
    }

    module TowerHole() {
        difference() {
            children();
            translate([0, 0, height_tower_bottom]) {
                linear_extrude(3.0) square([tower_size.x, tower_size.y], center=true);
            }
        }
    }

    module Base() {
        linear_extrude(tower_base_plate_feet[1]) mirror_copy([0,1]) mirror_copy([1,0]) {
            translate(-tower_base_plate_size / 2) square(tower_base_plate_feet[0]);
        }

        rotate(90, [1, 0]) {
            intersection() {
                linear_extrude(tower_base_plate_size.y,
                    center=true, convexity = 2
                ) {
                    SideProfile(0);
                }
                rotate(90, [0, 1]) {
                    linear_extrude(tower_base_plate_size.x, 
                        center=true, convexity = 2
                    ) {
                        SideProfile(1);
                    }
                }
            }
        }
        
        module SideProfile(index = 0) {
            polygon(copy_mirror_points([
                [
                    tower_base_plate_size[index] / 2 - tower_base_plate_overhang
                                                     - tan(tower_base_plate_overhang_angle)
                                                     * tower_base_plate_feet[1],
                    0
                ], [
                    tower_base_plate_size[index] / 2 - tower_base_plate_overhang,
                    tower_base_plate_feet[1]
                ], [
                    tower_base_plate_size[index] / 2,
                    tower_base_plate_feet[1]
                ], [
                    tower_base_plate_size[index] / 2,
                    height_plate_top
                ], [
                    plinth_outer_width[index] / 2,
                    height_plate_top
                ], [
                    plinth_outer_width[index] / 2,
                    height_plinth_top
                ], [
                    plinth_inner_width[index] / 2,
                    height_plinth_top
                ]
            ], [1, 0]));
        }
    }
}