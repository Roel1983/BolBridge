include <../../Config.inc>
use     <../Utils/Wall.scad>

include <ShortbeamBottomFace.inc>

ShortbeamBottomFace();

shortbeam_bottom_face_points = [
    [front_tower_inner, side_tower_outer - side_tower_center],
    [-front_tower_inner, side_tower_outer - side_tower_center],
    [-front_tower_inner, side_tower_inner - side_tower_center],    
    [front_tower_inner, side_tower_inner - side_tower_center],
];
shortbeam_bottom_face_angles    = [-45, 0, -45, 0];

module ShortbeamBottomFace() {
    Wall(
        points    = shortbeam_bottom_face_points,
        thickness = shortbeam_bottom_face_thickness,
        angles    = shortbeam_bottom_face_angles);
}
