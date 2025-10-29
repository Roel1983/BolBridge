include <../Config.inc>
include <../Modules/Components/ShortbeamBottomFace.inc>
include <../Modules/Components/Catwalk_PortalBeamBottom_Front.inc>

PortalBeamBottom_Front();

module PortalBeamBottom_Front_LocRot_Portal() {
    translate([
        0,
        0,
        height_shortbeam_bottom - explode
    ]) {
        rotate(180) rotate(180, [1,0]) {
            children();
        }
    }
}

module PortalBeamBottom_Front() {
    ShortbeamBottomFace(); // TODO rename
    Catwalk_PortalBeamBottom_Front();
}