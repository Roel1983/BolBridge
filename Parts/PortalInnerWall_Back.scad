include <../Config.inc>
include <../Modules/Components/PortalInnerWall.inc>
include <../Modules/Components/LongbeamBottomFace.inc>
include <../Modules/Components/Catwalk.inc>

PortalInnerWall_Back();

module PortalInnerWall_Back_LocRot_Portal() {
    translate([
        0,
        -tower_size.y / 2 - explode
    ]) {
        rotate(90, [1,0,0]) {
            children();
        }
    }
}

module PortalInnerWall_Back() {
    PortalInnerWall();
    translate([
        tower_distance.x / 2,
        height_longbeam_top - longbeam_height
        + catwalk_floor_thickness
    ]) {
        beam_inner = longbeam_inner - longbeam_center;
        catwalk_outer  = beam_inner - catwalk_floor_gap;
        catwalk_inner  = catwalk_outer - catwalk_floor_width;
        linear_extrude(1) {
            polygon([
                [catwalk_outer, 0],
                [catwalk_outer, -0.8],
                [catwalk_inner, -0.8],
                [catwalk_inner, 0],
            ]);
        }
    }
}