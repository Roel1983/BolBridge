include <../Config.inc>
include <../Modules/Components/LongbeamInnerFace.inc>

TrussInnerWall_Left();

module TrussInnerWall_Left_LocRot_Portal() {
    translate([
        -longbeam_width / 2 - explode,
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