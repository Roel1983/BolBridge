include <Config.inc>

include <TowerBase.inc>
include <TowerOuterFace.inc>
include <TowerInnerFace.inc>
include <GateFrontFace.inc>

use <Utils.scad>

tolerance    = 0.1;
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

TowerHole() Base();

linear_extrude(height_plinth_top + 10) {
    offset(delta=2, chamfer = true) offset(-2) InnerTower();
}

module InnerTower() {
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
            linear_extrude(tower_base_plate_size.y, center=true, convexity = 2) {
                Profile(0);
            }
            rotate(90, [0, 1]) {
                linear_extrude(tower_base_plate_size.x, center=true, convexity = 2) {
                    Profile(1);
                }
            }
        }
    }
}

module Profile(index = 0) {
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
