include <Config.inc>
use     <Wall.scad>

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

module LongbeamBottomFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([front_tower_center, 0, height_longbeam_bottom]) rotate(180, [0,1,0]) rotate(-90) children();
        } else if (i == 1) {
            translate([-front_tower_center, 0, height_longbeam_bottom]) rotate(180, [0,1,0])rotate( 90) children();
        } else {
            echo(str("LongbeamBottomFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
