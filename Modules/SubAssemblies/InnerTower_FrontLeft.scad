include <../../Config.inc>
use <../../Parts/TowerBase_FrontLeft.scad>
use <../../Parts/BaseTowerInnerCap_FrontLeft.scad>

include <InnerTower_FrontLeft.inc>

InnerTower_FrontLeft();

module InnerTower_FrontLeft_LocRot_Portal() {
    translate([
        -tower_distance.x / 2 - explode / 2,
        0,
        -explode
    ]) {
        children();
    }
}

module InnerTower_FrontLeft() {
    TowerBase_FrontLeft_LocRot_InnerTower() TowerBase_FrontLeft();
    BaseTowerInnerCap_FrontLeft_LocRot_InnerTower() BaseTowerInnerCap_FrontLeft();
}