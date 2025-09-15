include <../Config.inc>
include <../Modules/Components/TowerOuterSideWall.inc>

include <TowerOuterSideWall_FrontLeft.inc>

TowerOuterSideWall_FrontLeft();

module TowerOuterSideWall_FrontLeft_LocRot_Portal() {
    translate([-front_tower_outer, 0]) { // TODO
        rotate(-90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerOuterSideWall_FrontLeft() {
    TowerOuterFace(); // TODO rename
}