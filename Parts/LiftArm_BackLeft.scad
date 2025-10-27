include <../Config.inc>
include <../Modules/Components/LiftArm.inc>

LiftArm_BackLeft();

module LiftArm_BackLeft_LocRot_InnerTower() {
    SpindleLoc() {
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

module LiftArm_BackLeft() {
    LiftArm();
}