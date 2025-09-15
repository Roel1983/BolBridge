include <../../Config.inc>
include <../../Parts/PortalInnerWall_Front.inc>
include <../../Parts/PortalOuterWall_Front.inc>
include <../../Parts/TowerBase_FrontLeft.inc>
include <../../Parts/TowerBase_FrontRight.inc>
include <../../Parts/TowerOuterSideWall_FrontLeft.inc>
include <../../Parts/TowerOuterSideWall_FrontRight.inc>
include <../../Parts/TowerInnerSideWall_FrontLeft.inc>
include <../../Parts/TowerInnerSideWall_FrontRight.inc>

include <Portal_Front.inc>

Portal_Front();
       
module Portal_Front_LocRot_BridgeFrame() {
    translate([0, tower_distance.y / 2]) children();
}

module Portal_Front() {
    PortalInnerWall_Front_LocRot_Portal()         PortalInnerWall_Front();
    PortalOuterWall_Front_LocRot_Portal()         PortalOuterWall_Front();
    TowerBase_FrontLeft_LocRot_Portal()           TowerBase_FrontLeft();
    TowerBase_FrontRight_LocRot_Portal()          TowerBase_FrontRight();
    TowerOuterSideWall_FrontLeft_LocRot_Portal()  TowerOuterSideWall_FrontLeft();
    TowerOuterSideWall_FrontRight_LocRot_Portal() TowerOuterSideWall_FrontRight();
    TowerInnerSideWall_FrontLeft_LocRot_Portal()  TowerInnerSideWall_FrontLeft();
    TowerInnerSideWall_FrontRight_LocRot_Portal() TowerInnerSideWall_FrontRight();
}