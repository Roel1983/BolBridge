include <../../Config.inc>
use     <../Utils/Wall.scad>
use     <../Utils/Utils.scad>

include <LongbeamInnerFace.inc>
include <ShortbeamTopFace.inc>
include <GateFrontFace.inc>
include <LongbeamBottomFace.inc>
include <LongbeamTopFace.inc>
include <TowerSlideSlot.inc>

translate([-100, 0]) GateFrontFace();
translate([ 100, 0]) GateBackFace();

gate_front_face_points = copy_mirror_points([
    [ front_tower_inner,  height_shortbeam_bottom],
    [ front_tower_inner,  height_tower_bottom],
    [ front_tower_outer,  height_tower_bottom],
    [ front_tower_outer,  height_tower_side_top],
    [ front_tower_center, height_tower_center_top],
    [ front_tower_inner,  height_tower_side_top],
    [ front_tower_inner,  height_shortbeam_top]
]);
gate_front_face_angles    = [-45, 0, -45, 0, 0, -45, 0, -45, 0, 0, -45, 0, -45, -45];
gate_front_face_offsets   = [  0, 0,   0, 0, 0,   0, -shortbeam_top_face_thickness];

module GateFrontFace() {
    Wall(
        points    = gate_front_face_points,
        thickness = gate_front_face_thickness,
        angles    = gate_front_face_angles,
        offsets   = gate_front_face_offsets);
}

module GateBackFace() {
    TowerSlideSlotGateBackFace()
    LongbeamRim()
    Wall(
        points    = gate_front_face_points,
        thickness = gate_back_face_thickness,
        angles    = gate_front_face_angles,
        offsets   = gate_front_face_offsets);
    
    module LongbeamRim() {
        difference() {
            union() {
                children();
                 linear_extrude(gate_front_face_longbeam_rim) {
                     offset(1) offset(-1) mirror_copy([1,0,0]) Shape();
                 }
            }
            translate([0,0,-gate_front_face_thickness-0.1]) {
                mirror_copy([1,0,0]) linear_extrude(gate_front_face_longbeam_rim+2) {
                    offset(1) offset(-1 - .4*4) mirror_copy([1,0,0]) Shape();
                }
            }
        }
        module Shape() {
            polygon([
                [
                    front_tower_inner      + longbeam_inner_face_thickness,
                    height_longbeam_bottom + longbeam_bottom_face_thickness
                ], [
                    front_tower_inner      + longbeam_inner_face_thickness,
                    height_longbeam_top    - longbeam_top_face_thickness
                ], [
                    front_tower_outer      - longbeam_inner_face_thickness,
                    height_longbeam_top    - longbeam_top_face_thickness
                ], [
                    front_tower_outer      - longbeam_inner_face_thickness,
                    height_longbeam_bottom + longbeam_bottom_face_thickness
                ]
            ]);
        }
    }
}