include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_FrontRight();

module TowerBase_FrontRight_LocRot_Portal() {
    translate([
        tower_distance.x / 2 + explode / 2,
        0,
        -explode
    ]) {
        children();
    }
}

module TowerBase_FrontRight() {
    mirror([0, 0]) TowerBase();
}