include <../Config.inc>
include <../Modules/Components/LiftArm.inc>

LiftArm_BackRight();

module LiftArm_BackRight_LocRot_InnerTower() {
    mirror([1,0,0]) SpindleLoc() mirror([1,0,0]) {
        from = -lift_arm_l_bottom 
               + tower_slide_slot_inner_bottom;
        to   = +lift_arm_l_top
               + tower_slide_slot_inner_top
               - lift_arm_base_height;
        translate([0,0,from + (to - from) * position]) {
            children();
        }
    }
}

module LiftArm_BackRight() {
    mirror([1,0,0]) LiftArm();
}