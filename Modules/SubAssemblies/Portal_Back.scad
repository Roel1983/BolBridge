include <../../Config.inc>
include <../../Parts/PortalInnerWall_Back.inc>
include <../../Parts/PortalOuterWall_Back.inc>
include <../../Parts/TowerBase_BackLeft.inc>
include <../../Parts/TowerBase_BackRight.inc>
include <../../Parts/TowerOuterSideWall_BackLeft.inc>
include <../../Parts/TowerOuterSideWall_BackRight.inc>
include <../../Parts/TowerInnerSideWall_BackLeft.inc>
include <../../Parts/TowerInnerSideWall_BackRight.inc>


include <Portal_Back.inc>

Portal_Back();

module Portal_Back_LocRot_BridgeFrame() {
    translate([0, -tower_distance.y / 2]) rotate(180) children();
}

module Portal_Back() {
    PortalInnerWall_Back_LocRot_Portal()         PortalInnerWall_Back();
    PortalOuterWall_Back_LocRot_Portal()         PortalOuterWall_Back();
    TowerBase_BackLeft_LocRot_Portal()           TowerBase_BackLeft();
    TowerBase_BackRight_LocRot_Portal()          TowerBase_BackRight();
    TowerOuterSideWall_BackLeft_LocRot_Portal()  TowerOuterSideWall_BackLeft();
    TowerOuterSideWall_BackRight_LocRot_Portal() TowerOuterSideWall_BackRight();
    TowerInnerSideWall_BackLeft_LocRot_Portal()  TowerInnerSideWall_BackLeft();
    TowerInnerSideWall_BackRight_LocRot_Portal() TowerInnerSideWall_BackRight();
}