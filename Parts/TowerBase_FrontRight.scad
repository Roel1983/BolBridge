include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

include <TowerBase_FrontRight.inc>

TowerBase_FrontRight();

module TowerBase_FrontRight_LocRot_Portal() {
    translate([tower_distance.x / 2, 0]) {
        children();
    }
}

module TowerBase_FrontRight() {
    mirror([0, 0]) TowerBase();
}