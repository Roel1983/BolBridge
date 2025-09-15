include <../../Config.inc>

include <PortalCommon.inc>

PortalOuterWall();

module PortalOuterWall_LocRot_Portal() {
    translate([0, tower_size.y / 2]) {
        rotate(180) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module PortalOuterWall() {
    PortalWall();
}