use <LiftArm.scad>

include <TowerBase.inc>
include <TowerSlideSlot.inc>

lift_arm_nut_height       = 15;
lift_arm_bottom_thickness = 0.5;
lift_arm_top_thickness    = 0.5;

lift_arm_base_height = lift_arm_nut_height
                     + lift_arm_bottom_thickness
                     + lift_arm_top_thickness;
lift_arm_height      = 5.0;
lift_arm_l_bottom    = min(
                        tower_slide_slot_inner_bottom
                            - base_tower_bearing_floor_thickness
                            - base_tower_bearing_height,
                        lift_arm_base_height - lift_arm_height
                     );
lift_arm_l_top       = lift_arm_base_height
                     - lift_arm_height
                     - lift_arm_l_bottom;


echo(lift_arm_nut_height       = lift_arm_nut_height);
echo(lift_arm_bottom_thickness = lift_arm_bottom_thickness);
echo(lift_arm_top_thickness    = lift_arm_top_thickness);
echo(lift_arm_base_height      = lift_arm_base_height);
echo(lift_arm_height           = lift_arm_height);
echo(lift_arm_l_bottom         = lift_arm_l_bottom);
echo(lift_arm_l_top            = lift_arm_l_top);