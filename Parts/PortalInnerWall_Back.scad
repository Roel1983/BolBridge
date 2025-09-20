include <../Config.inc>
include <../Modules/Components/PortalInnerWall.inc>

PortalInnerWall_Back();

module PortalInnerWall_Back_LocRot_Portal() {
    translate([
        0,
        -tower_size.y / 2 - explode
    ]) {
        rotate(90, [1,0,0]) {
            children();
        }
    }
}

module PortalInnerWall_Back() {
    PortalInnerWall();
}