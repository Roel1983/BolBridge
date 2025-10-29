include <../Config.inc>
include <../Modules/Components/LongbeamBottomFace.inc>
include <../Modules/Components/Catwalk_TrussBottom_Right.inc>

TrussBottom_Right();

module TrussBottom_Right_LocRot_Portal() {
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

module TrussBottom_Right() {
    mirror([1, 0, 0]) {
        LongbeamBottomFace(); // TODO rename
        Catwalk_TrussBottom_Right();
    }
}