include <../../Config.inc>
use <../../Parts/PortalInnerWall_Front.scad>
use <../../Parts/PortalOuterWall_Front.scad>
use <../../Parts/TowerOuterSideWall_FrontLeft.scad>
use <../../Parts/TowerOuterSideWall_FrontRight.scad>
use <../../Parts/TowerInnerSideWall_FrontLeft.scad>
use <../../Parts/TowerInnerSideWall_FrontRight.scad>
use <../../Parts/PortalBeamTop_Front.scad>
use <../../Parts/PortalBeamBottom_Front.scad>

include <InnerTower_FrontLeft.inc>
include <InnerTower_FrontRight.inc>
include <TowerRoof.inc>

include <Portal_Front.inc>

Portal_Front();
       
module Portal_Front_LocRot_BridgeFrame() {
    translate([
        0,
        tower_distance.y / 2 + explode * 2
    ]) children();
}

module Portal_Front() {
    InnerTower_FrontLeft_LocRot_Portal()          InnerTower_FrontLeft();
    InnerTower_FrontRight_LocRot_Portal()         InnerTower_FrontRight();
    
    PortalInnerWall_Front_LocRot_Portal()         PortalInnerWall_Front();
    PortalOuterWall_Front_LocRot_Portal()         PortalOuterWall_Front();
    TowerOuterSideWall_FrontLeft_LocRot_Portal()  TowerOuterSideWall_FrontLeft();
    TowerOuterSideWall_FrontRight_LocRot_Portal() TowerOuterSideWall_FrontRight();
    TowerInnerSideWall_FrontLeft_LocRot_Portal()  TowerInnerSideWall_FrontLeft();
    TowerInnerSideWall_FrontRight_LocRot_Portal() TowerInnerSideWall_FrontRight();
    PortalBeamTop_Front_LocRot_Portal()           PortalBeamTop_Front();
    PortalBeamBottom_Front_LocRot_Portal()        PortalBeamBottom_Front();
    TowerRoof_Right_LocRot_Portal()               TowerRoof();
    TowerRoof_Left_LocRot_Portal()                TowerRoof();
}