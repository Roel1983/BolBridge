include <../Modules/Components/PortalOuterWall.inc>

PortalOuterWall_Front();

module PortalOuterWall_Front_LocRot_Portal() {
    PortalOuterWall_LocRot_Portal() children();
}

module PortalOuterWall_Front() {
    PortalOuterWall();
}