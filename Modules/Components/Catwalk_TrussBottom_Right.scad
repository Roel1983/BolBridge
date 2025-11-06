include <../../Config.inc>
include <LongbeamBottomFace.inc>
include <Catwalk.inc>

Catwalk_TrussBottom_Right();

module Catwalk_TrussBottom_Right() {
    Catwalk(
        beam_inner = front_tower_inner - front_tower_center,
        beam_outer = front_tower_outer - front_tower_center,
        beam_from  = -side_tower_inner,
        beam_to    =  side_tower_inner,
        beam_bottom_face_thickness = longbeam_bottom_face_thickness,
        catwalk_to_offset = 12,
        support_count = 22
    );
}