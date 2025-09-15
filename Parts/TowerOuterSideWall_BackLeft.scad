include <../Config.inc>
include <../Modules/Components/TowerOuterSideWall.inc>

include <TowerOuterSideWall_BackLeft.inc>

TowerOuterSideWall_BackLeft();

module TowerOuterSideWall_BackLeft_LocRot_Portal() {
    translate([front_tower_outer, 0]) { // TODO
        rotate(90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerOuterSideWall_BackLeft() {
    mirror([1,0,0]) TowerOuterFace(); // TODO rename
}