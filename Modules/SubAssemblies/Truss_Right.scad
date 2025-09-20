include <../../Config.inc>
use <../../Parts/TrussOuterWall_Right.scad>
use <../../Parts/TrussInnerWall_Right.scad>
use <../../Parts/TrussBottom_Right.scad>
use <../../Parts/TrussTop_Right.scad>
include <Truss_Right.inc>

Truss_Right();

module Truss_Right_LocRot_BridgeFrame() {
    translate([
        -tower_distance.x / 2 + explode / 2,
        0,
        height_beam_top - longbeam_height / 2
    ]) {
        children();
    }
}

module Truss_Right() {
    TrussOuterWall_Right_LocRot_Portal() TrussOuterWall_Right();
    TrussInnerWall_Right_LocRot_Portal() TrussInnerWall_Right();
    TrussBottom_Right_LocRot_Portal()    TrussBottom_Right();
    TrussTop_Right_LocRot_Portal()       TrussTop_Right();
}