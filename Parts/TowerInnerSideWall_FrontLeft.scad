include <../Config.inc>
include <../Modules/Components/TowerInnerSideWall.inc>

TowerInnerSideWall_FrontLeft();

module TowerInnerSideWall_FrontLeft_LocRot_Portal() {
    translate([
        -front_tower_inner,
        0
    ]) {
        rotate(90, [0,0,1]) {
            rotate(90, [1,0,0]) {
                children();
            }
        }
    }
}

module TowerInnerSideWall_FrontLeft() {
    TowerInnerFace(); // TODO rename
}