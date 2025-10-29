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
    
    module Overhang() {
        assert(beam_roof_thickness <= longbeam_top_face_thickness);
        linear_extrude(beam_roof_thickness) {
            polygon(
                longbeam_top_face_points + [
                    [0, beam_roof_overhang],
                    [0, beam_roof_overhang],
                    [0, -beam_roof_overhang],
                    [0, -beam_roof_overhang]
                ]
            );
        }
    }
}
