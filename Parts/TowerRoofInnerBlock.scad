include <../Config.inc>
include <../Modules/Components/TowerRoofInnerBlock.inc>

TowerRoofInnerBlock();

module TowerRoofInnerBlock_LocRot_TowerRoof() {
    translate([0,0,-towerRoofInnerBlock_topHeight]) {
        TowerRoofInnerBlock();
    }
}