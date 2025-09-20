include <../Config.inc>
include <../Modules/Components/LongbeamBottomFace.inc>

TrussBottom_Left();

module TrussBottom_Left_LocRot_Portal() {
    translate([
        0,
        0,
        -longbeam_height / 2 - explode
    ]) {
        rotate(180, [1, 0, 0]) {
            rotate(90) {
                children();
            }
        }
    }
}

module TrussBottom_Left() {
    LongbeamBottomFace(); // TODO rename
}