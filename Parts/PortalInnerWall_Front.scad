include <../Config.inc>
include <../Modules/Components/PortalInnerWall.inc>

PortalInnerWall_Front();

module PortalInnerWall_Front_LocRot_Portal() {
    translate([
        0,
        -tower_size.y / 2 - explode
    ]) {
        rotate(90, [1,0,0]) {
            children();
        }
    }
}

module PortalInnerWall_Front() {
    PortalInnerWall();
}