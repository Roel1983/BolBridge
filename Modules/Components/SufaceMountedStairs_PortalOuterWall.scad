use <../Utils/Utils.scad>

include <../../Config.inc>
include <PortalCommon.inc>

step_width    = 5.0;
step_distance = 4.0;

SufaceMountedStairs_PortalOuterWall();

module SufaceMountedStairs_PortalOuterWall() {
    translate([front_tower_center - 4.0 , 0, portal_wall_thickness]) {
        for(y=[
            step_distance:
            step_distance:
            (height_shortbeam_bottom + height_shortbeam_top)/2
        ]) translate([0, y]) {
            Step();
        }
    }
    
    module Step() {
        $fn = 8;
        h1 = 0.8;
        h2 = 0.3;
        w1 = step_width;
        w2 = step_width - 2.5;
        
        rotate(90, [1,0]) linear_extrude(0.4, center=true) {
            difference() {
                hull() {
                    mirror_copy([1, 0]) {
                        translate([w1 / 2, 0]) {
                            square(h1 / 2);
                            translate([0, h1 / 2]) {
                                circle(d = h1);
                            }
                        }
                    }
                }
                hull() {
                    mirror_copy([1, 0]) {
                        translate([w2 / 2, 0]) {
                            circle(r = h2);
                        }
                    }
                }
            }
        }
    }
}