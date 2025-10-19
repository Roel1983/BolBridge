include <../../Config.inc>
include <../SubAssemblies/TowerRoof.inc>
include <../Components/TowerRoofSurface.inc>

translate([0, 5]) {
    projection(cut=true) {
        rotate(-90, [1,0]) translate([0, towerRoofSurface_slot_distance / 2]) TowerRoof();
    }
}

translate([0, -5]) {
    projection(cut=true) {
        rotate(90,[0,1,0])rotate(-90, [1,0]) rotate(tower_roof_angle, [0, 1, 0]) {
            translate([4,0]) TowerRoof();
        }
    }
}