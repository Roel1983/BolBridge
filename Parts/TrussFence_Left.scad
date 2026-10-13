include <../Config.inc>

include <../Modules/Utils/fence.inc>
include <../Modules/Components/Catwalk.inc>
include <../Modules/Utils/fence.inc>

use <TrussBottom_Left.scad>

TrussFence_Left(printable = true);

module TrussFence_Left_LocRot_Portal() {
    beam_inner     = longbeam_inner - longbeam_center;
    catwalk_outer  = beam_inner       - catwalk_floor_gap;
    catwalk_inner  = catwalk_outer    - catwalk_floor_width;
    
    TrussBottom_Left_LocRot_Portal() {
        translate([0, catwalk_inner]) {
            rotate(180, [0,1]) {
                children();
            }
        }
    }
}

module TrussFence_Left(printable = false) {
    from   = -side_tower_inner + 11.82;
    to     =  side_tower_inner - 11.82;
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
        );
    }
}

include <../Modules/Utils/fence.scad>