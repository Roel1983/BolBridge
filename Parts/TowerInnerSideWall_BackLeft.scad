include <../Config.inc>
include <../Modules/Components/TowerInnerSideWall.inc>

include <TowerInnerSideWall_BackLeft.inc>

TowerInnerSideWall_BackLeft();

module TowerInnerSideWall_BackLeft_LocRot_Portal() {
    translate([front_tower_inner, 0]) {
        rotate(-90, [0,0,1]) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerInnerSideWall_BackLeft() {
    mirror([1,0,0]) TowerInnerFace(); // TODO rename
}