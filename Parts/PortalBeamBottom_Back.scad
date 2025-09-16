include <../Config.inc>
include <../Modules/Components/ShortbeamBottomFace.inc>

PortalBeamBottom_Back();

module PortalBeamBottom_Back_LocRot_Portal() {
    translate([0, 0, height_shortbeam_bottom]) {
        rotate(180, [1,0]) {
            children();
        }
    }
}

module PortalBeamBottom_Back() {
    ShortbeamBottomFace(); // TODO rename
}