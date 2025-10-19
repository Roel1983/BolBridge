include <../../Config.inc>
use     <../Utils/Wall.scad>

include <TowerRoofSurface.inc>

TowerRoofSurface();

module TowerRoofSurface() {
    roof_size = [
        tower_size.x / 2 + tower_roof_overhang,
        tower_size.y + 2 * tower_roof_overhang
    ];

    points = [
        [ 0,  roof_size.y / 2],
        [ 0, -roof_size.y / 2],
        [roof_size.x, -roof_size.y / 2],
        [roof_size.x,  roof_size.y / 2]
    ];
    
    rotate(180, [1,0,0]) {
        Wall(
            points    = points,
            thickness = towerRoofSurface_thickness,
            angles    = [-tower_roof_angle, 0, 0, 0]
        );
    }
}