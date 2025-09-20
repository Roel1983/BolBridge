include <../Config.inc>
include <../Modules/Components/LongbeamTopFace.inc>

TrussTop_Right();

module TrussTop_Right_LocRot_Portal() {
    translate([
        0,
        0,
        longbeam_height / 2 + explode
    ]) {
        rotate(180, [1,0,0]) {
            rotate(90) children();
        }
    }
}

module TrussTop_Right() {
    mirror([0, 1, 0]) {
        LongbeamTopFace(); // TODO rename
    }
}