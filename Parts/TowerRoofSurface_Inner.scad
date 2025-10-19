include <../Config.inc>
include <../Modules/Components/TowerRoofSurface.inc>

TowerRoofSurface_Inner_LocRot_TowerRoof() TowerRoofSurface_Inner();

module TowerRoofSurface_Inner_LocRot_TowerRoof() {
    rotate(180) {
        translate([0,0,towerRoofSurface_thickness / cos(tower_roof_angle)]) {
            rotate(tower_roof_angle, [0, 1, 0]) {
                translate([0,0,-towerRoofSurface_thickness]) {
                    children();
                }
            }
        }
    }
}

module TowerRoofSurface_Inner() {
    mirror([0, 1, 0]) {
        TowerRoofSurface();
    }
}