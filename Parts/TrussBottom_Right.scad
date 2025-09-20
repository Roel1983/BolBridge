include <../Config.inc>
include <../Modules/Components/LongbeamBottomFace.inc>

TrussBottom_Right();

module TrussBottom_Right_LocRot_Portal() {
    translate([0, 0, -longbeam_height / 2]) {
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
    }
}