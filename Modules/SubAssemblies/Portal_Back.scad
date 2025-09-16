include <../../Config.inc>
use <../../Parts/PortalInnerWall_Back.scad>
use <../../Parts/PortalOuterWall_Back.scad>
use <../../Parts/TowerBase_BackLeft.scad>
use <../../Parts/TowerBase_BackRight.scad>
use <../../Parts/TowerOuterSideWall_BackLeft.scad>
use <../../Parts/TowerOuterSideWall_BackRight.scad>
use <../../Parts/TowerInnerSideWall_BackLeft.scad>
use <../../Parts/TowerInnerSideWall_BackRight.scad>
use <../../Parts/PortalBeamTop_Back.scad>
use <../../Parts/PortalBeamBottom_Back.scad>

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
    PortalBeamTop_Back_LocRot_Portal()           PortalBeamTop_Back();
    PortalBeamBottom_Back_LocRot_Portal()        PortalBeamBottom_Back();
}