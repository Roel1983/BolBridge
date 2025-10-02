include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_FrontRight();

module TowerBase_FrontRight_LocRot_InnerTower() {
    children();
}

module TowerBase_FrontRight() {
    mirror([0, 0]) TowerBase();
}