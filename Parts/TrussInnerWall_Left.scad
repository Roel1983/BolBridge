include <../Config.inc>
include <../Modules/Components/LongbeamInnerFace.inc>

TrussInnerWall_Left_LocRot_Portal() TrussInnerWall_Left();

module TrussInnerWall_Left_LocRot_Portal() {
    translate([
        -tower_size.x / 2,
        0,
        -longbeam_height / 2
    ]) {
        rotate(-90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TrussInnerWall_Left() {
    LongbeamInnerFace(); // TODO rename
}