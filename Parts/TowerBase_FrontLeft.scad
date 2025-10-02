include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_FrontLeft();

module TowerBase_FrontLeft_LocRot_InnerTower() {
    children();
}

module TowerBase_FrontLeft() {
    mirror([1, 0]) TowerBase();
}