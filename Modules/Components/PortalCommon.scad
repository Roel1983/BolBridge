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
    Wall(
        points    = portal_wall_points,
        thickness = portal_wall_thickness,
        angles    = portal_wall_angles,
        offsets   = portal_wall_offsets);
}

