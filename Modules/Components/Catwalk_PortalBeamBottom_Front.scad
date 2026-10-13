include <../../Config.inc>
include <ShortbeamBottomFace.inc>
include <Catwalk.inc>

include <Catwalk_PortalBeamBottom_Front.inc>

Catwalk_PortalBeamBottom_Front();

module Catwalk_PortalBeamBottom_Front() {
    Catwalk(
        beam_inner = side_tower_inner - side_tower_center,
        beam_outer = side_tower_outer - side_tower_center,
        beam_from  = -front_tower_inner,
        beam_to    =  front_tower_inner,
        beam_bottom_face_thickness = shortbeam_bottom_face_thickness,
        catwalk_from_offset = shortbeam_bottom_front_catwalk_from_offset,
        catwalk_to_offset = shortbeam_bottom_front_catwalk_to_offset,
        support_count = shortbeam_bottom_front_support_count
    );
}