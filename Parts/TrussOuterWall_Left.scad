include <../Config.inc>
include <../Modules/Components/LongbeamOuterFace.inc>

TrussOuterWall_Left();

module TrussOuterWall_Left_LocRot_Portal() {
    translate([
        longbeam_width / 2 - longbeam_outer_face_indent + explode,
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

module TrussOuterWall_Left() {
    LongbeamOuterFace(); // TODO rename
}