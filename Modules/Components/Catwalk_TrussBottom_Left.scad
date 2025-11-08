include <../../Config.inc>
include <LongbeamBottomFace.inc>
include <Catwalk.inc>

Catwalk_TrussBottom_Left();

module Catwalk_TrussBottom_Left() {
    Catwalk(
        beam_inner = longbeam_inner - longbeam_center,
        beam_outer = longbeam_outer - longbeam_center,
        beam_from  = -side_tower_inner,
        beam_to    =  side_tower_inner,
        beam_bottom_face_thickness = longbeam_bottom_face_thickness,
        support_count = 22
    );
}