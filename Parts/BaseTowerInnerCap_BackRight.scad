include <../Config.inc>
include <../Modules/Components/BaseTowerInnerCap.inc>

BaseTowerInnerCap_BackRight();

module BaseTowerInnerCap_BackRight() {
    translate([0, 0, base_tower_inner_cap_height]) {
        mirror([0,0,1]) BaseTowerInnerCap();
    }
}