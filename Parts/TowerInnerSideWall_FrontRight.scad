include <../Config.inc>
include <../Modules/Components/TowerInnerSideWall.inc>

include <TowerInnerSideWall_FrontRight.inc>

TowerInnerSideWall_FrontRight_LocRot_Portal() TowerInnerSideWall_FrontRight();

module TowerInnerSideWall_FrontRight_LocRot_Portal() {
    translate([front_tower_inner, 0]) {
        rotate(-90, [0,0,1]) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerInnerSideWall_FrontRight() {
    mirror([1,0,0]) TowerInnerFace(); // TODO rename
}