include <../../Config.inc>
use <../Utils/Utils.scad>
use <../Utils/Bar.scad>
include <ShortbeamBottomFace.inc>
include <Catwalk.inc>

Catwalk_PortalBeamBottom_Back();

module Catwalk_PortalBeamBottom_Back() {
    Catwalk(
        beam_inner = side_tower_inner - side_tower_center,
        beam_outer = side_tower_outer - side_tower_center,
        beam_from  = -front_tower_inner,
        beam_to    =  front_tower_inner,
        beam_bottom_face_thickness = shortbeam_bottom_face_thickness,
        catwalk_from_offset = 12,
        catwalk_to_offset = 12,
        support_count = 7,
        style = "thick-beam"
    );
    
    beam_w = 3;
    
    mirror_copy([0,1]) {
        translate([0, side_tower_inner - side_tower_center]) {
            rotate(90)rotate(180, [1,0,0]) {
                translate([beam_w/2, -front_tower_inner]) {
                    HBarProfile(
                        length    = 2 * front_tower_inner,
                        width     = beam_w,
                        height    = 4.8,
                        thickness = 0.8,
                        overhang  = 60);
                }
            }
        }
    }
}