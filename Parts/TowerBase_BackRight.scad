include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_BackRight();

module TowerBase_BackRight_LocRot_Portal() {
    translate([
        -tower_distance.x / 2 - explode / 2,
        0,
        - explode
    ]) {
        children();
    }
}

module TowerBase_BackRight() {
    rotate(180) mirror([0,1]) TowerBase();
}