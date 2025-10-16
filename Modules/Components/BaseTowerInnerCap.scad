include <TowerBase.inc>
include <GateFrontFace.inc>
use <../Utils/Utils.scad>

$fn = 64; 

bearing_diameter = bearing_10x4_diameter;
bearing_height   = bearing_10x4_height;

BaseTowerInnerCap();

module BaseTowerInnerCap() {
    difference() {
        Cap();
        Bearing();
        screw_holes();
        WireHoles();
    }
    
    module WireHoles() {
        mirror_copy([-1, 1]) {
            translate([0, 0, -1]) linear_extrude(10) hull() {
                translate([tower_size.x / 2 - gate_back_face_thickness, 0]) {
                    circle(d=4);
                }
                translate([tower_size.x / 2 - gate_back_face_thickness - 1, 1]) {
                    circle(d=4);
                }
                translate([tower_size.x / 2 - gate_back_face_thickness - 1, 2]) {
                    circle(d=4);
                }
                translate([tower_size.x / 2 - gate_back_face_thickness, 3]) {
                    circle(d=4);
                }
            }
        }
    }

    module screw_holes() {
        mirror_copy([-1,1]) {
            translate([
                base_tower_top_screw_location.x,
                base_tower_top_screw_location.y,
                -1
            ]) {
                cylinder(d=3.1, h=2 + 5);
                translate([0,0,5]) render() {
                    cylinder(d= 5.8, h = 2);
                    mirror([0,0,1]) {
                        cylinder(d1= 5.8, d2=1.8, h = 2);
                    }
                }
            }
        } 
    }

    module Bearing() {
        SpindleLoc() {
            translate([0,0,-1]) cylinder(d=bearing_diameter-2*.1, 2);
            translate([0,0,5/2]) {
                cylinder(d=bearing_diameter, bearing_height, center = true);
            }
            translate([0,0,5-1]) cylinder(d=bearing_diameter-2*.5, 2);
        }
    }

    module Cap( ) {
        tolerance_snug  = 0.1;
        linear_extrude(1) {
            offset(-tolerance_snug) TowerBaseInnerProfileInner();
        }
        translate([0, 0, base_tower_top_screw_inset]) {
            
            linear_extrude(5 - base_tower_top_screw_inset) {
                offset(.5) TowerBaseInnerProfileInner();
            }
        }
    }
}
