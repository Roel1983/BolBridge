include <Config.inc>
use     <Wall.scad>
use     <Utils.scad>

include <TowerInnerFace.inc>
include <GateFrontFace.inc>
include <ShortbeamTopFace.inc>
include <ShortbeamBottomFace.inc>
include <TowerSlideSlot.inc>

TowerInnerFace();

tower_inner_face_points = [
    [side_tower_outer                             - side_tower_center, height_tower_bottom],
    [side_tower_outer                             - side_tower_center, height_shortbeam_bottom],
    [side_tower_outer - gate_front_face_thickness - side_tower_center, height_shortbeam_bottom],
    [side_tower_outer - gate_front_face_thickness - side_tower_center, height_shortbeam_top],
    [side_tower_outer                             - side_tower_center, height_shortbeam_top],
    [side_tower_outer                             - side_tower_center, height_tower_side_top],
    [side_tower_inner                             - side_tower_center, height_tower_side_top],
    [side_tower_inner                             - side_tower_center, height_shortbeam_top],
    [side_tower_inner + gate_front_face_thickness - side_tower_center, height_shortbeam_top],
    [side_tower_inner + gate_front_face_thickness - side_tower_center, height_shortbeam_bottom],
    [side_tower_inner                             - side_tower_center, height_shortbeam_bottom],
    [side_tower_inner                             - side_tower_center, height_tower_bottom]
];

tower_inner_face_angles = [-45,0,0,0,-45, tower_roof_angle, -45, 0, 0, 0, -45];
tower_inner_face_offsets = [0 ,0,0, shortbeam_top_face_thickness, 0, 0, 0, shortbeam_top_face_thickness];

module TowerInnerFace() {
    
    TowerSlideSlotTowerInnerFace()
    ShortbeamRim()
    Wall(
        points    = tower_inner_face_points,
        thickness = tower_inner_face_thickness,
        angles    = tower_inner_face_angles,
        offsets   = tower_inner_face_offsets
    );
    
    module ShortbeamRim() {
        difference() {
            union() {
                children();
                linear_extrude(tower_inner_face_shortbeam_rim) {
                    offset(1) offset(-1) Shape();
                }
            }
            translate([0,0,-tower_inner_face_thickness-.1]) {
                linear_extrude(
                    tower_inner_face_shortbeam_rim+2,
                    convexity = 2
                ) {
                    offset(1) offset(-1 - .4*4) Shape();
                }
            }
        }
        module Shape() {
            polygon([
                [
                    side_tower_outer - gate_front_face_thickness - side_tower_center,
                    height_shortbeam_bottom + shortbeam_bottom_face_thickness
                ], [
                    side_tower_outer - gate_front_face_thickness - side_tower_center,
                    height_shortbeam_top - shortbeam_top_face_thickness
                ], [
                    side_tower_inner + gate_front_face_thickness - side_tower_center,
                    height_shortbeam_top - shortbeam_top_face_thickness
                ], [
                    side_tower_inner + gate_front_face_thickness - side_tower_center,
                    height_shortbeam_bottom + shortbeam_bottom_face_thickness
                ]
            ]);
        }
    }
}
module TowerInnerFaceRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([ front_tower_inner, -side_tower_center]) rotate(-90) rotate(90, [1,0,0]) children();
        } else if (i == 1) {
            translate([-front_tower_inner, -side_tower_center]) rotate( 90) rotate(90, [1,0,0]) mirror() children();
        } else if (i == 2) {
            translate([-front_tower_inner,  side_tower_center]) rotate( 90) rotate(90, [1,0,0]) children();
        } else if (i == 3) {
            translate([ front_tower_inner,  side_tower_center]) rotate(-90) rotate(90, [1,0,0]) mirror() children();
        } else {
            echo(str("TowerInnerFaceRotLoc(", index, "). Invalid 'index'"));
        }
    }
}
