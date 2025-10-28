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
    Overhang();
    
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

    module Overhang() {
        assert(beam_roof_thickness <= shortbeam_top_face_thickness);
        linear_extrude(beam_roof_thickness) {
            polygon(
                shortbeam_top_face_points + [
                    [0, beam_roof_overhang],
                    [0, beam_roof_overhang],
                    [0, -beam_roof_overhang],
                    [0, -beam_roof_overhang]
                ]
            );
        }
    }
}