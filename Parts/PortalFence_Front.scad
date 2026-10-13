include <../Config.inc>
include <../Modules/Utils/fence.inc>
include <../Modules/Components/Catwalk.inc>
include <../Modules/Components/Catwalk_PortalBeamBottom_Front.inc>

use <../Parts/PortalBeamBottom_Front.scad>

PortalFence_Front(printable=true);

module PortalFence_Front_LocRot_Portal() {
    beam_inner     = side_tower_inner - side_tower_center;
    catwalk_outer  = beam_inner       - catwalk_floor_gap;
    catwalk_inner  = catwalk_outer    - catwalk_floor_width;
    
    PortalBeamBottom_Front_LocRot_Portal() {
        translate([0, catwalk_inner]) {
            rotate(180, [0,1]) {
                children();
            }
        }
    }
}

module PortalFence_Front(printable=false) {
    from   = -front_tower_inner
           + shortbeam_bottom_front_catwalk_to_offset;
    to     =  front_tower_inner - 22.5;
    length = to - from;
    
    translate([from, 0]) {
        fence(
            length                  = length,
            post_thickness          =  0.6,
            post_width              =  0.4,
            post_height             =  8.0,
            post_distance           =  8.0,
            post_reference_absolute =  0.0,
            post_reference_relative =  0.5,
            post_from_offset        =  2.0,
            post_to_offset          =  2.0,
            post_at_start           = true,
            post_at_end             = true,

            rail_thickness          =  0.4,
            rail_width              =  0.4,
            rail_pos_z              = [4.0, 8.0],
            printable = printable
        ) fence(length = 10.44, slope= 12.1)
        fence(length = 2.5, slope= 0);
    }
}

include <../Modules/Utils/fence.scad>