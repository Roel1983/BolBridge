include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <LongbeamOuterFace.inc>
include <LongbeamTopFace.inc>

LongbeamOuterFace();

longbeam_outer_face_points = [
    [ side_tower_inner, height_longbeam_top    - height_longbeam_bottom],
    [-side_tower_inner, height_longbeam_top    - height_longbeam_bottom], 
    [-side_tower_inner, height_longbeam_bottom - height_longbeam_bottom],
    [ side_tower_inner, height_longbeam_bottom - height_longbeam_bottom],
];
longbeam_outer_face_angles    = [0, 0, -45, 0];
longbeam_outer_face_offsets   = [-longbeam_top_face_thickness];

module LongbeamOuterFace() {
    // TODO 9 vertical ribs
    Wall(
        points    = longbeam_outer_face_points,
        thickness = longbeam_outer_face_thickness,
        angles    = longbeam_outer_face_angles,
        offsets   = longbeam_outer_face_offsets);
    rib_width = 0.4;
    rib_count = 9;
    linear_extrude(1) {
        polygon([
            [
                -side_tower_inner, 
                height_longbeam_bottom - height_longbeam_bottom
            ], [
                -side_tower_inner,
                height_longbeam_bottom - height_longbeam_bottom + rib_width
            ], [
                side_tower_inner,
                height_longbeam_bottom - height_longbeam_bottom + rib_width
            ], [
                side_tower_inner,
                height_longbeam_bottom - height_longbeam_bottom
            ]
        ]);
        Distribute() {
            #polygon([
                [
                    -rib_width/2, 
                    height_longbeam_bottom - height_longbeam_bottom
                ], [
                    -rib_width/2,
                    height_longbeam_top - height_longbeam_bottom
                ], [
                    rib_width/2,
                    height_longbeam_top - height_longbeam_bottom
                ], [
                    rib_width/2,
                    height_longbeam_bottom - height_longbeam_bottom
                ]
            ]);
        }
    }
    module Distribute() {
        for(i = [1:rib_count]) {
            translate([
                -side_tower_inner + (2 * side_tower_inner) * i / (rib_count + 1),
                0
            ]) children();
        }
    }
}

//TODO add ribs with a height of longbeam_outer_face_indent