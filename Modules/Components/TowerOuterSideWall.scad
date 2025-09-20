include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <TowerOuterSideWall.inc>

TowerOuterFace();

tower_outer_face_points = [
    [side_tower_outer - side_tower_center, height_tower_bottom],
    [side_tower_outer - side_tower_center, height_tower_side_top],
    [side_tower_inner - side_tower_center, height_tower_side_top],
    [side_tower_inner - side_tower_center, height_tower_bottom]
];
tower_outer_face_angles = [-45, tower_roof_angle, -45, 0];

module TowerOuterFace() {
    Wall(
        points    = tower_outer_face_points,
        thickness = tower_outer_face_thickness,
        angles    = tower_outer_face_angles);
}
