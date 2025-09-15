include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <LongbeamInnerFace.inc>
include <LongbeamTopFace.inc>

LongbeamInnerFace();

longbeam_inner_face_points = [
    [ side_tower_inner, height_longbeam_top    - height_longbeam_bottom],
    [-side_tower_inner, height_longbeam_top    - height_longbeam_bottom], 
    [-side_tower_inner, height_longbeam_bottom - height_longbeam_bottom],
    [ side_tower_inner, height_longbeam_bottom - height_longbeam_bottom],
];
longbeam_inner_face_angles    = [0, 0, -35, 0];
longbeam_inner_face_offsets   = [-longbeam_top_face_thickness];

module LongbeamInnerFace() {
    Wall(
        points    = longbeam_inner_face_points,
        thickness = longbeam_inner_face_thickness,
        angles    = longbeam_inner_face_angles,
        offsets   = longbeam_inner_face_offsets);
}

module LongbeamInnerFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([ front_tower_outer, 0, height_longbeam_bottom]) rotate( 90) rotate(90, [1,0,0]) children();
        } else if (i == 1) {
            translate([ front_tower_inner, 0, height_longbeam_bottom]) rotate(-90) rotate(90, [1,0,0]) children();
        } else if (i == 2) {
            translate([-front_tower_inner, 0, height_longbeam_bottom]) rotate( 90) rotate(90, [1,0,0]) children();
        } else if (i == 3) {
            translate([-front_tower_outer, 0, height_longbeam_bottom]) rotate(-90) rotate(90, [1,0,0]) children();
        } else {
            echo(str("LongbeamInnerFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
