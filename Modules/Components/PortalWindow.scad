include <../../Config.inc>
use <../Utils/RoundedRectangle.scad>

include <PortalCommon.inc>

portal_window_size            = [35, 15];
portal_window_radius          = 3;
portal_window_rim_width       = 0.8;
portal_window_rim_thickness   = 0.3;
portal_window_center_position = [
        0,
        (height_shortbeam_bottom + height_shortbeam_top) / 2
];


PortalWindow()
mirror([0,0,1]) linear_extrude(portal_wall_thickness) {
    translate(portal_window_center_position) {
        square(portal_window_size * 1.5, center= true);
    }
}

module PortalWindow() {
    size  = [35, 15];
    radius =  3;
    rim_width = 1;
    rim_thickness = 0.3;
    
    difference() {
        union() {
            children();
            translate(portal_window_center_position) {
                linear_extrude(rim_thickness) {
                    offset(rim_width) {
                        RoundedRectangle(size, radius, $fn = 32);
                    }
                }
            }
        }
        translate(portal_window_center_position) {
            linear_extrude(portal_wall_thickness * 2.1, center= true) {
                RoundedRectangle(size, radius, $fn = 32);
            }
        }
    }
}