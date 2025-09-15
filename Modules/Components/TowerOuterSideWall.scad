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

module TowerOuterFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([ front_tower_outer, -side_tower_center]) rotate( 90) rotate(90, [1,0,0]) children();
        } else if (i == 1) {
            translate([-front_tower_outer, -side_tower_center]) rotate(-90) rotate(90, [1,0,0]) children();
        } else if (i == 2) {
            translate([-front_tower_outer,  side_tower_center]) rotate(-90) rotate(90, [1,0,0]) children();
        } else if (i == 3) {
            translate([ front_tower_outer,  side_tower_center]) rotate( 90) rotate(90, [1,0,0]) children();
        } else {
            echo(str("TowerOuterFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
