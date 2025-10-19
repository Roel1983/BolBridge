include <../../Config.inc>

use <../../Parts/TowerRoofSurface_Inner.scad>
use <../../Parts/TowerRoofSurface_Outer.scad>
use <../../Parts/TowerRoofInnerBlock.scad>

include <TowerRoof.inc>

TowerRoof();

module TowerRoof_Right_LocRot_Portal() {
    translate([
        front_tower_center,
        0,
        height_tower_center_top]
    ) {
        children();
    }
}

module TowerRoof_Left_LocRot_Portal() {
    translate([
        -front_tower_center,
        0,
        height_tower_center_top]
    ) {
        children();
    }
}

module TowerRoof() {
    TowerRoofSurface_Inner_LocRot_TowerRoof() TowerRoofSurface_Inner();
    TowerRoofSurface_Outer_LocRot_TowerRoof() TowerRoofSurface_Outer();
    TowerRoofInnerBlock_LocRot_TowerRoof()    TowerRoofInnerBlock();
}