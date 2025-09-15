include <../../Config.inc>
use     <../Utils/Utils.scad>

include <GateFrontFace.inc>
include <LongbeamBottomFace.inc>
include <LongbeamInnerFace.inc>
include <LongbeamTopFace.inc>
include <TowerSlideSlot.inc>

include <PortalCommon.inc>

PortalInnerWall();

module PortalInnerWall_LocRot_Portal() {
    translate([0, -tower_size.y / 2]) {
        rotate(90, [1,0,0]) {
            children();
        }
    }
}

module PortalInnerWall() {
    TowerSlideSlotGateBackFace() // TODO rename to TowerSlideSlot_PortalInnerWall
    LongbeamRim()
    PortalWall();
    
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