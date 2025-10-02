include <../../Config.inc>
use <../../Parts/TowerBase_FrontRight.scad>

include <InnerTower_FrontRight.inc>

InnerTower_FrontRight();

module InnerTower_FrontRight_LocRot_Portal() {
    translate([
        tower_distance.x / 2 + explode / 2,
        0,
        -explode
    ]) {
        children();
    }
}

module InnerTower_FrontRight() {
    TowerBase_FrontRight_LocRot_InnerTower() TowerBase_FrontRight();
}