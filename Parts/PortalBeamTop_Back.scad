include <../Config.inc>
include <../Modules/Components/ShortbeamTopFace.inc>

PortalBeamTop_Back();

module PortalBeamTop_Back_LocRot_Portal() {
    translate([
        0,
        0,
        height_shortbeam_top + explode
    ]) {
        rotate(180, [1,0]) {
            children();
        }
    }
}

module PortalBeamTop_Back() {
    ShortbeamTopFace(); // TODO rename
}