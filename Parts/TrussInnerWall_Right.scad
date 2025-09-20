include <../Config.inc>
include <../Modules/Components/LongbeamInnerFace.inc>

TrussInnerWall_Right();

module TrussInnerWall_Right_LocRot_Portal() {
    translate([
        tower_size.x / 2 + explode,
        0,
        -longbeam_height / 2
    ]) {
        rotate(90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TrussInnerWall_Right() {
    mirror([1, 0, 0]) {
        LongbeamInnerFace(); // TODO rename
    }
}