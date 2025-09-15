include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

include <TowerBase_FrontLeft.inc>

TowerBase_FrontLeft();

module TowerBase_FrontLeft_LocRot_Portal() {
    translate([-tower_distance.x / 2, 0]) {
        children();
    }
}

module TowerBase_FrontLeft() {
    mirror([1, 0]) TowerBase();
}