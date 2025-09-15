include <../Modules/Components/PortalInnerWall.inc>

include <PortalInnerWall_Front.inc>

PortalInnerWall_Front();

module PortalInnerWall_Front_LocRot_Portal() {
    PortalInnerWall_LocRot_Portal() children();
}

module PortalInnerWall_Front() {
    PortalInnerWall();
}