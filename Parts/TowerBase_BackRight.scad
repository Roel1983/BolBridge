include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

include <TowerBase_BackRight.inc>

TowerBase_BackRight();

module TowerBase_BackRight_LocRot_Portal() {
    translate([-tower_distance.x / 2, 0]) {
        children();
    }
}

module TowerBase_BackRight() {
    rotate(180) mirror([0,1]) TowerBase();
}