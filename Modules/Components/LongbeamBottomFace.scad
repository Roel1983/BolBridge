include <../../Config.inc>
use     <../Utils/Wall.scad>

include <LongbeamBottomFace.inc>

LongbeamBottomFace();

longbeam_bottom_face_points = [
    [ side_tower_inner, front_tower_outer - front_tower_center],
    [-side_tower_inner, front_tower_outer - front_tower_center],
    [-side_tower_inner, front_tower_inner - front_tower_center], 
    [ side_tower_inner, front_tower_inner - front_tower_center],
];
longbeam_bottom_face_angles = [-55, 0, -55];

module LongbeamBottomFace() {
    Wall(
        points    = longbeam_bottom_face_points,
        thickness = longbeam_bottom_face_thickness,
        angles    = longbeam_bottom_face_angles);
}
