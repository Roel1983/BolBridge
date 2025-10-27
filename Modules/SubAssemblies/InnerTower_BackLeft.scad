include <../../Config.inc>
use <../../Parts/TowerBase_BackLeft.scad>
use <../../Parts/BaseTowerInnerCap_BackLeft.scad>
use <../../Parts/LiftArm_BackLeft.scad>

include <InnerTower_BackLeft.inc>

InnerTower_BackLeft();

module InnerTower_BackLeft_LocRot_Portal() {
    translate([
        tower_distance.x / 2 + explode / 2,
        0,
        -explode
    ]) {
        children();
    }
}

module InnerTower_BackLeft() {
    TowerBase_BackLeft_LocRot_InnerTower()         TowerBase_BackLeft();
    BaseTowerInnerCap_BackLeft_LocRot_InnerTower() BaseTowerInnerCap_BackLeft();
    LiftArm_BackLeft_LocRot_InnerTower()           LiftArm_BackLeft();
}