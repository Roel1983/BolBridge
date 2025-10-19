include <../Config.inc>
include <../Modules/Components/TowerRoofSurface.inc>

TowerRoofSurface_Outer();

module TowerRoofSurface_Outer_LocRot_TowerRoof() {
    translate([0,0,towerRoofSurface_thickness]) {
        rotate(tower_roof_angle, [0, 1, 0]) {
            translate([0,0,-towerRoofSurface_thickness]) {
                children();
            }
        }
    }
}

module TowerRoofSurface_Outer() {
    mirror([0, 1, 0]) {
        TowerRoofSurface();
    }
}