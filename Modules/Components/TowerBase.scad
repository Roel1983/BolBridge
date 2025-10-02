include <../../Config.inc>

include <TowerBase.inc>
include <TowerOuterSideWall.inc>
include <TowerInnerSideWall.inc>
include <GateFrontFace.inc>
include <TowerSlideSlot.inc>
include <LiftArm.inc>

use <../Utils/Utils.scad>
use <../Utils/HexNut.scad>

tower_base_nut_height    =  4.0;
tower_base_spring_height = 10.0;

tolerance_wall_outer = 0.05;
tolerance_wall_inner = 0.05;
floor_thickness      = 2.0;
inner_tower_wall_thickness = 0.8;

tower_base_inner_tower_height = tower_slide_slot_inner_top
                              + lift_arm_l_top
                              + 2 * tower_base_nut_height
                              + tower_base_spring_height
                              + base_tower_top_screw_inset;

plinth_inner_width = [
    tower_size.x + tolerance_wall_outer,
    tower_size.y + tolerance_wall_outer
];
plinth_outer_width = [
    plinth_inner_width.x + tower_base_plinth_thickness,
    plinth_inner_width.y + tower_base_plinth_thickness
];

height_plate_top    = tower_base_plate_feet[1]
                    + tower_base_plate_thickness;
height_plinth_top   = height_plate_top + tower_base_plinth_height;
tower_outer_wall_inner = [
    tower_size.x / 2 - gate_front_face_thickness  - tolerance_wall_inner,
    tower_size.y / 2 - tower_outer_face_thickness - tolerance_wall_inner
];
tower_inner_wall_inner = [
    tower_size.x / 2 - gate_back_face_thickness   - tolerance_wall_inner,
    tower_size.y / 2 - tower_inner_face_thickness - tolerance_wall_inner
];

TowerBase();

module TowerBase() {
    nut_wall     =  1.6;
    
    WireHoles() NutHoleTowerBase() Spindle() InnerTower() TowerHole() Base();
    
    module Spindle() {
        bearing_diameter        = base_tower_bearing_diameter;
        bearing_height          = base_tower_bearing_height;
        bearing_floor_thickness = base_tower_bearing_floor_thickness;
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
                    d = bearing_diameter - .1 * bottom_rim,
                    h = bearing_floor_thickness + 2 * bias,
                    $fn = 64);
                translate([0, 0, bearing_floor_thickness]) cylinder(
                    d = bearing_diameter - 2 * top_rim,
                    h = bearing_height + bearing_top_rim_height + bias,
                    $fn = 64);
            }
        }
    }

    module InnerTower() {
        difference() {
            union() {
                children();
                linear_extrude(
                    tower_base_inner_tower_height
                ) TowerBaseInnerProfileOuter();
            }
            difference() {
                translate([0,0,floor_thickness]) {
                    NutHoleInnerTowerInner()
                    TowerSlideSlotTowerBaseInnerTowerInner([
                        tower_inner_wall_inner.x - inner_tower_wall_thickness,
                        tower_inner_wall_inner.y - inner_tower_wall_thickness
                    ]) linear_extrude(
                        tower_base_inner_tower_height
                    ) TowerBaseInnerProfileInner();
                }
                TopScrewHoles_Additive();
            }
            TopScrewHoles_Subtractive();
        }
        
        top_screw_holes_pos_z = tower_base_inner_tower_height 
                              - 15 - base_tower_top_screw_inset;
        
        module TopScrewHoles_Additive() {
            translate([0, 0, top_screw_holes_pos_z]) {
                mirror_copy([-1,1]) {
                    Balcony();
                }
            }
            
            module Balcony() {
                hull() {
                    translate([
                        tower_inner_wall_inner.x * sign(base_tower_top_screw_location.x),
                        tower_inner_wall_inner.y * sign(base_tower_top_screw_location.y)
                    ]) rotate(45) {
                        linear_extrude(5 + 10) {
                            square([10, 10], center = true);
                        }
                    }
                    translate([
                        base_tower_top_screw_location.x,
                        base_tower_top_screw_location.y,
                        10  
                    ]) {
                        cylinder(d = 5.5 / sin(60) + 4 * 0.4, 5, $fn=32);
                    }
                }
            }
        }
        
        module TopScrewHoles_Subtractive() {
            translate([0, 0, top_screw_holes_pos_z]) {
                mirror_copy([-1,1]) {
                    HexNutHole();
                }
            }
            
            module HexNutHole() {
                translate([
                    base_tower_top_screw_location.x,
                    base_tower_top_screw_location.y,
                    10
                ]) {
                    rotate(90) M3HexHole_Horizontal(l1 = 5.0, l2 = 10.0, slide = 5);
                }
            }
        }
        
        module TopScrewHoles() {
            difference() {
                union() {
                    children();
                    translate([0, 0, tower_slide_slot_inner_top]) {
                        mirror_copy([-1,1]) {
                            Balcony();
                        }
                    }
                }
                translate([0, 0, tower_slide_slot_inner_top]) {
                    mirror_copy([-1,1]) {
                        HexNutHole();
                    }
                }
            }
            
            module HexNutHole() {
                translate([
                    base_tower_top_screw_location.x,
                    base_tower_top_screw_location.y,
                    10
                ]) {
                    rotate(90) M3HexHole_Horizontal(l1 = 5.0, l2 = 10.0, slide = 5);
                }
            }
            
            module Balcony() {
                hull() {
                    translate([
                        tower_inner_wall_inner.x * sign(base_tower_top_screw_location.x),
                        tower_inner_wall_inner.y * sign(base_tower_top_screw_location.y)
                    ]) rotate(45) {
                        linear_extrude(5 + 10) {
                            square([10, 10], center = true);
                        }
                    }
                    translate([
                        base_tower_top_screw_location.x,
                        base_tower_top_screw_location.y,
                        10  
                    ]) {
                        cylinder(d = 5.5 / sin(60) + 4 * 0.4, 5, $fn=32);
                    }
                }
            }
        }
    }

    module TowerHole() {
        difference() {
            children();
            translate([0, 0, height_tower_bottom]) {
                linear_extrude(3.0) square(plinth_inner_width, center=true);
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
    module NutHoleInnerTowerInner() {
        difference() {
            children();
            NutHoleLoc() {
                linear_extrude(1.5 + 4) rotate(45) Hex(6 + 2 * nut_wall);
            }
        }
    }
    module NutHoleTowerBase() {
        BIAS = 0.1;
        hex_size = 6;
        holde_d  = 5.2;
        
        difference() {
            children();
            NutHoleLoc() {
                translate([0,0, 1.5]) {
                    linear_extrude(4) rotate(45) Hex(hex_size);
                    linear_extrude(4.15) {
                        intersection() {
                            square([holde_d, hex_size], true);
                            rotate(45) Hex(hex_size);
                        }
                    }
                }
                translate([0,0,-BIAS]) cylinder(d = holde_d, h = 20, $fn = 64);
            }
        }
    }
    module NutHoleLoc() {
        translate([4.5, 4.5]) {
            children();
        }
    }
    
    module WireHoles() {
        BIAS = 0.1;
        d = 5;
        difference() {
            children();
            mirror_copy([-1,1,0])Hole();
        }
        
        module Hole() {
            translate([0,0,-BIAS]) linear_extrude(10) {
                hull() {
                    translate([
                        -(tower_inner_wall_inner.x - inner_tower_wall_thickness - d/2),
                         (tower_inner_wall_inner.y - inner_tower_wall_thickness - d/2)
                    ]) circle(d=d, $fn=64);
                    translate([
                         (tower_inner_wall_inner.x - inner_tower_wall_thickness - d/2 - 9),
                         (tower_inner_wall_inner.y - inner_tower_wall_thickness - d/2)
                    ]) circle(d=d, $fn=64);
                }
            }
        }
    }
}

module TowerBaseInnerProfile() {
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

tower_base_inner_profile_chamfer = 2;

module TowerBaseInnerProfileOuter() {
    offset(
        delta   = tower_base_inner_profile_chamfer,
        chamfer = true
    ) offset(
        delta   = -tower_base_inner_profile_chamfer
    ) TowerBaseInnerProfile();
}

module TowerBaseInnerProfileInner() {
    offset(
        delta   = tower_base_inner_profile_chamfer - inner_tower_wall_thickness,
        chamfer = true
    ) offset(
        delta   = -tower_base_inner_profile_chamfer
    ) TowerBaseInnerProfile();
}

module SpindleLoc() {
    translate([
        - tower_size.x/2 + spindle_center_to_outer_wall,
        - tower_size.y/2 + spindle_center_to_outer_wall
    ]) children();
}