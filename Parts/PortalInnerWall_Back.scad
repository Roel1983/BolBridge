include <../Modules/Components/PortalInnerWall.inc>

PortalInnerWall_Back();

module PortalInnerWall_Back_LocRot_Portal() {
    PortalInnerWall_LocRot_Portal() children();
}

module PortalInnerWall_Back() {
    PortalInnerWall();
}