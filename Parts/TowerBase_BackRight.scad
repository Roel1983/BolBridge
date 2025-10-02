include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_BackRight();

module TowerBase_BackRight_LocRot_InnerTower() {
    children();
}

module TowerBase_BackRight() {
    rotate(180) mirror([0,1]) TowerBase();
}