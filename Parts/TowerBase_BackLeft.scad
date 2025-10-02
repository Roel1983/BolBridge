include <../Config.inc>
include <../Modules/Components/TowerBase.inc>

TowerBase_BackLeft();

module TowerBase_BackLeft_LocRot_InnerTower() {
    children();
}

module TowerBase_BackLeft() {
    rotate(180) mirror([1,1]) TowerBase();
}