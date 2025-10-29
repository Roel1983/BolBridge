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
longbeam_outer_face_angles    = [0, 0, -35, 0];
longbeam_outer_face_offsets   = [-longbeam_top_face_thickness];

module LongbeamOuterFace() {
    difference() {
        Wall(
            points    = longbeam_outer_face_points,
            thickness = longbeam_outer_face_thickness,
            angles    = longbeam_outer_face_angles,
            offsets   = longbeam_outer_face_offsets);
    }
}
