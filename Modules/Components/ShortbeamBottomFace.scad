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

module ShortbeamBottomFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([0, -side_tower_center, height_shortbeam_bottom]) rotate(180, [1,0,0]) children();
        } else if (i == 1) {
            translate([0,  side_tower_center, height_shortbeam_bottom]) rotate(180) rotate(180, [1,0,0]) children();
        } else {
            echo(str("ShortbeamBottomFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
