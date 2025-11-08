include <../Config.inc>
include <../Modules/Components/LongbeamOuterFace.inc>

TrussOuterWall_Right();

module TrussOuterWall_Right_LocRot_Portal() {
    translate([
        -longbeam_width / 2 + longbeam_outer_face_indent - explode,
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

module TrussOuterWall_Right() {
    mirror([1, 0, 0]) {
        LongbeamOuterFace(); // TODO rename
    }
}