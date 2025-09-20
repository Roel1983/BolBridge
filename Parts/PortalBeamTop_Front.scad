include <../Config.inc>
include <../Modules/Components/ShortbeamTopFace.inc>

PortalBeamTop_Front();

module PortalBeamTop_Front_LocRot_Portal() {
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

module PortalBeamTop_Front() {
    ShortbeamTopFace(); // TODO rename
}