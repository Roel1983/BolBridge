include <../../Config.inc>
include <ShortbeamBottomFace.inc>
include <Catwalk.inc>

Catwalk_PortalBeamBottom_Front();

module Catwalk_PortalBeamBottom_Front() {
    Catwalk(
        beam_inner = side_tower_inner - side_tower_center,
        beam_outer = side_tower_outer - side_tower_center,
        beam_from  = -front_tower_inner,
        beam_to    =  front_tower_inner,
        beam_bottom_face_thickness = shortbeam_bottom_face_thickness,
        catwalk_from_offset = 5,
        catwalk_to_offset = 10.5,
        support_count = 5
    );
}