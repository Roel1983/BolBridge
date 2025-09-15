include <../../Config.inc>
use     <../Utils/Wall.scad>

include <LongbeamTopFace.inc>
include <GateFrontFace.inc>
include <LongbeamInnerFace.inc>

LongbeamTopFace();

longbeam_top_face_points = [
    [ side_tower_inner, front_tower_outer - front_tower_center],
    [-side_tower_inner, front_tower_outer - front_tower_center],
    [-side_tower_inner, front_tower_inner - front_tower_center], 
    [ side_tower_inner, front_tower_inner - front_tower_center],
];
longbeam_top_face_glue_crack = [0, 0.1, 0, 0.1];

module LongbeamTopFace() {
    rotate(180, [0,1,0])Wall(
        points     = longbeam_top_face_points,
        thickness  = longbeam_top_face_thickness,
        glue_crack = longbeam_top_face_glue_crack);
    Rim();
    
    module Rim() {
        linear_extrude(2) difference() {
            offset(delta=3, chamfer =true) offset(-3) Shape();
            offset(delta=3-.4*4, chamfer =true) offset(-3) Shape();
        }
        module Shape() {
            tolerance = .1;
            polygon([
                [
                    side_tower_inner - gate_front_face_longbeam_rim - tolerance,
                    front_tower_outer - front_tower_center - longbeam_inner_face_thickness - tolerance
                ], [
                    -side_tower_inner + gate_front_face_longbeam_rim + tolerance,
                    front_tower_outer - front_tower_center - longbeam_inner_face_thickness - tolerance
                ], [
                    -side_tower_inner + gate_front_face_longbeam_rim + tolerance,
                    front_tower_inner - front_tower_center + longbeam_inner_face_thickness + tolerance
                ], [
                    side_tower_inner - gate_front_face_longbeam_rim - tolerance,
                    front_tower_inner - front_tower_center + longbeam_inner_face_thickness + tolerance
                ],
            ]);
        }
    }
}

module LongbeamTopFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([front_tower_center, 0, height_longbeam_top]) rotate(-90) rotate(180, [0,1,0]) children();
        } else if (i == 1) {
            translate([-front_tower_center, 0, height_longbeam_top]) rotate( 90) rotate(180, [0,1,0]) children();
        } else {
            echo(str("LongbeamTopFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
