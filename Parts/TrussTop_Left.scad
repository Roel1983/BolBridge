include <../Config.inc>
include <../Modules/Components/LongbeamTopFace.inc>

TrussTop_Left();

module TrussTop_Left_LocRot_Portal() {
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

module TrussTop_Left() {
    LongbeamTopFace(); // TODO rename
}