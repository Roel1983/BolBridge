include <../Config.inc>
include <../Modules/Components/TowerOuterSideWall.inc>

TowerOuterSideWall_BackRight();

module TowerOuterSideWall_BackRight_LocRot_Portal() {
    translate([-front_tower_outer, 0]) { // TODO
        rotate(-90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerOuterSideWall_BackRight() {
    mirror([1,0,0]) TowerOuterFace(); // TODO rename
}