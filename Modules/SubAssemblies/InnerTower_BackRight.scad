include <../../Config.inc>
use <../../Parts/TowerBase_BackRight.scad>
use <../../Parts/BaseTowerInnerCap_BackRight.scad>
use <../../Parts/LiftArm_BackRight.scad>

include <InnerTower_BackRight.inc>

InnerTower_BackRight();

module InnerTower_BackRight_LocRot_Portal() {
    translate([
        -tower_distance.x / 2 - explode / 2,
        0,
        - explode
    ]) {
        children();
    }
}

module InnerTower_BackRight() {
    TowerBase_BackRight_LocRot_InnerTower() TowerBase_BackRight();
    BaseTowerInnerCap_BackRight_LocRot_InnerTower() BaseTowerInnerCap_BackRight();
    LiftArm_BackRight_LocRot_InnerTower()           LiftArm_BackRight();
}