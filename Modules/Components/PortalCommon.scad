include <../../Config.inc>
use     <../Utils/Utils.scad>
use     <../Utils/Wall.scad>

include <ShortbeamTopFace.inc> // TODO rename

include <PortalCommon.inc>

PortalWall();

portal_wall_points = copy_mirror_points([
    [ front_tower_inner,  height_shortbeam_bottom],
    [ front_tower_inner,  height_tower_bottom],
    [ front_tower_outer,  height_tower_bottom],
    [ front_tower_outer,  height_tower_side_top],
    [ front_tower_center, height_tower_center_top],
    [ front_tower_inner,  height_tower_side_top],
    [ front_tower_inner,  height_shortbeam_top]
]);

portal_wall_angles    = [-45, 0, -45, 0, 0, -45, 0, -45, 0, 0, -45, 0, -45, -45];
portal_wall_offsets   = [  0, 0,   0, 0, 0,   0, -shortbeam_top_face_thickness]; // TODO rename shortbeam_top_face_thickness

module PortalWall() {
    PortalWindow()
    Wall(
        points    = portal_wall_points,
        thickness = portal_wall_thickness,
        angles    = portal_wall_angles,
        offsets   = portal_wall_offsets);
    
    module PortalWindow() {
        size  = [50, 15];
        radius =  3;
        rim_width = 1;
        rim_thickness = 0.3;
        
        position_z = (height_shortbeam_bottom
                      + height_shortbeam_top) / 2;
        
        difference() {
            union() {
                children();
                translate([0, position_z]) {
                    linear_extrude(rim_thickness) {
                        offset(rim_width) {
                            rounded_rectangle(size, radius, $fn = 32);
                        }
                    }
                }
            }
            translate([0, position_z]) {
                linear_extrude(portal_wall_thickness * 2.1, center= true) rounded_rectangle(size, radius, $fn = 32);
            }
        }
    }

    module rounded_rectangle(size, radius) {
        minkowski() {
            square([size.x - 2 * radius, 
                    size.y - 2 * radius], true);
            circle(radius);
        }
    }
}

