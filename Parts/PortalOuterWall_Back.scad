include <../Modules/Components/PortalOuterWall.inc>

include <PortalOuterWall_Back.inc>

PortalOuterWall_Back();

module PortalOuterWall_Back_LocRot_Portal() {
    PortalOuterWall_LocRot_Portal() children();
}

module PortalOuterWall_Back() {
    PortalOuterWall();
}