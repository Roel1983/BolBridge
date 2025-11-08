include <../../Config.inc>
use     <../Utils/Wall.scad>
include <LongbeamOuterFace.inc>

include <LongbeamBottomFace.inc>

LongbeamBottomFace();

longbeam_bottom_face_points = [
    [ side_tower_inner, longbeam_outer - longbeam_center - longbeam_outer_face_indent],
    [-side_tower_inner, longbeam_outer - longbeam_center - longbeam_outer_face_indent],
    [-side_tower_inner, longbeam_inner - longbeam_center], 
    [ side_tower_inner, longbeam_inner - longbeam_center],
];
longbeam_bottom_face_angles = [-45, 0, -55];

module LongbeamBottomFace() {
    Wall(
        points    = longbeam_bottom_face_points,
        thickness = longbeam_bottom_face_thickness,
        angles    = longbeam_bottom_face_angles);
}
