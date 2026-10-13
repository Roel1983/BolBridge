include <../../Config.inc>
include <LongbeamInnerFace.inc>
include <LongbeamTopFace.inc>

include <../../Modules/Components/LongbeamOuterFace.inc>

echo(-longbeam_width / 2 + longbeam_inner_face_thickness);
echo( longbeam_width / 2 - longbeam_inner_face_thickness - longbeam_outer_face_indent);