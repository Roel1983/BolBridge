include <../Config.inc>
include <../Modules/Components/PortalOuterWall.inc>
include <../Modules/Components/PortalWindow.inc>

PortalOuterWall_Front();

module PortalOuterWall_Front_LocRot_Portal() {
    translate([
        0,
        tower_size.y / 2 + explode
    ]) {
        rotate(180) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module PortalOuterWall_Front() {
    PortalWindow()
    PortalOuterWall();
}