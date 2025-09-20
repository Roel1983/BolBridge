include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <TowerInnerSideWall.inc>
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
