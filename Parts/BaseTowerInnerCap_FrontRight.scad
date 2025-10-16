include <../Config.inc>
include <../Modules/Components/BaseTowerInnerCap.inc>
include <../Modules/Components/TowerBase.inc>
use     <../Modules/Components/TowerBase.scad>

BaseTowerInnerCap_FrontRight();

module BaseTowerInnerCap_FrontRight_LocRot_InnerTower() {
    translate([
        0,0,
        tower_base_inner_tower_height()
        + base_tower_inner_cap_height
        - base_tower_top_screw_inset
        + explode
    ]) {
        rotate(180, [1,0,0]) {
            rotate(180) children();
        }
    }
}

module BaseTowerInnerCap_FrontRight() {
    translate([0, 0, base_tower_inner_cap_height]) {
        mirror([1,0,0]) mirror([0,0,1]) BaseTowerInnerCap();
    }
}