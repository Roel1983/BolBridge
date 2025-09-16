include <../Config.inc>
include <../Modules/Components/TowerOuterSideWall.inc>

TowerOuterSideWall_FrontRight();

module TowerOuterSideWall_FrontRight_LocRot_Portal() {
    translate([front_tower_outer, 0]) { // TODO
        rotate(90) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerOuterSideWall_FrontRight() {
    TowerOuterFace(); // TODO rename
}