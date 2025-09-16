include <../../Config.inc>
use <../../Parts/PortalInnerWall_Front.scad>
use <../../Parts/PortalOuterWall_Front.scad>
use <../../Parts/TowerBase_FrontLeft.scad>
use <../../Parts/TowerBase_FrontRight.scad>
use <../../Parts/TowerOuterSideWall_FrontLeft.scad>
use <../../Parts/TowerOuterSideWall_FrontRight.scad>
use <../../Parts/TowerInnerSideWall_FrontLeft.scad>
use <../../Parts/TowerInnerSideWall_FrontRight.scad>

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