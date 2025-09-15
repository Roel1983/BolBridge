include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <ShortbeamTopFace.inc>
include <TowerInnerSideWall.inc>
include <GateFrontFace.inc>

ShortbeamTopFace();

shortbeam_top_face_points = [
    [ front_tower_inner, side_tower_outer - side_tower_center],
    [-front_tower_inner, side_tower_outer - side_tower_center],
    [-front_tower_inner, side_tower_inner - side_tower_center],    
    [ front_tower_inner, side_tower_inner - side_tower_center],
];
shortbeam_top_face_glue_crack = [0,.1,0,.1];

module ShortbeamTopFace() {
    rotate(180, [1,0]) Wall(
        points     = shortbeam_top_face_points,
        thickness  = shortbeam_top_face_thickness,
        glue_crack = shortbeam_top_face_glue_crack);
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
                    front_tower_inner - tower_inner_face_shortbeam_rim - tolerance,
                    side_tower_outer - gate_front_face_thickness - side_tower_center - tolerance
                ], [
                    -front_tower_inner + tower_inner_face_shortbeam_rim + tolerance,
                    side_tower_outer - gate_front_face_thickness - side_tower_center - tolerance
                ], [
                    -front_tower_inner + tower_inner_face_shortbeam_rim + tolerance,
                    side_tower_inner + gate_front_face_thickness - side_tower_center + tolerance
                ], [
                    front_tower_inner - tower_inner_face_shortbeam_rim - tolerance,
                    side_tower_inner + gate_front_face_thickness - side_tower_center + tolerance
                ],
            ]);
        }
    }    
}

module ShortbeamTopFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([0, -side_tower_center, height_shortbeam_top]) rotate(180, [1,0]) children();
        } else if (i == 1) {
            translate([0,  side_tower_center, height_shortbeam_top]) rotate(180, [1,0]) rotate(180) children();
        } else {
            echo(str("ShortbeamBottomFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
