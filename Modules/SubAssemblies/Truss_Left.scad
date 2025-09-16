include <../../Config.inc>
use <../../Parts/TrussOuterWall_Left.scad>
use <../../Parts/TrussInnerWall_Left.scad>
use <../../Parts/TrussBottom_Left.scad>
use <../../Parts/TrussTop_Left.scad>
include <Truss_Left.inc>

Truss_Left();

module Truss_Left_LocRot_BridgeFrame() {
    translate([tower_distance.x / 2, 0, height_beam_top - longbeam_height / 2]) {
        children();
    }
}

module Truss_Left() {
    TrussOuterWall_Left_LocRot_Portal() TrussOuterWall_Left();
    TrussInnerWall_Left_LocRot_Portal() TrussInnerWall_Left();
    TrussBottom_Left_LocRot_Portal()    TrussBottom_Left();
    TrussTop_Left_LocRot_Portal()       TrussTop_Left();
}