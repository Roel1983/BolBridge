include <../../Config.inc>
use     <../Utils/Utils.scad>
use     <../Utils/Wall.scad>

include <TowerRoofSurface.inc>

TowerRoofSurface();

module TowerRoofSurface() {
    Surface();
    rotate(180, [1, 0, 0]) {
        rotate(-tower_roof_angle, [0, 1, 0]) {
            translate([0, 0, -towerRoofSurface_thickness]) {
                TowerRoofSurface_Slots();
            }
        }
    }
    
    module Surface() {
        roof_size = [
            (tower_size.x / 2) / cos(tower_roof_angle) + tower_roof_overhang,
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
}

module TowerRoofSurface_Slots(offset_r = 0, offset_x = 0, offset_z = 0) {
    nozzle = 0.4;
    BIAS = 0.1;
    l = 1.0;
    
    d1 = nozzle * 4 + offset_r + 0.05;
    d2 = nozzle * 4 + offset_r;
    
    
    rotate(tower_roof_angle, [0,1,0]) {
        mirror_copy([0,5,0]) translate([0, towerRoofSurface_slot_distance / 2]) {
            translate([0,0,-l - offset_z]) {
                hull() {
                    translate([2 - offset_x, 0]) {
                        Pin();
                    }
                    translate([tower_size.x / 2 - 3 + offset_x, 0]) {
                        Pin();
                    }
                }
            }
        }
    }
    
    module Pin() {
        cylinder(d1 = d1, d2 = d2, h = l + offset_z + BIAS, $fn = 32);
        translate([0, 0, - .2]) {
            cylinder(d1 = d1 - .2, d2 = d1, h = .2, $fn = 32);
        }
    }
}