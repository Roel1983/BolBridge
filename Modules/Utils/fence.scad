include <fence.inc>

module fence(
    length,
    slope,
    post_thickness,
    post_width,
    post_height,
    post_distance,
    post_reference_absolute,
    post_reference_relative,
    post_from_offset,
    post_to_offset,
    post_at_start,
    post_at_end,

    rail_thickness,
    rail_width,
    rail_pos_z,

    printable /*=false*/
) {
    CHILD_INDEX_NEXT_SEGMENT     = 0;
    CHILD_INDEX_PREVIOUS_SEGMENT = 1;
    
    is_top_level = is_undef($fence_printable);
    assert(is_top_level || is_undef(printable),
        "Parameter 'printable' can only be set on top level");
    $fence_printable = resolve_param($fence_printable, printable, default = false);
       
    $fence_length                  = resolve_param($fence_length, length);
    $fence_slope                   = resolve_param($fence_slope,  slope);
    $fence_post_thickness          = resolve_param($fence_post_thickness, post_thickness);
    $fence_post_width              = resolve_param($fence_post_width, post_width);
    $fence_post_height             = resolve_param($fence_post_height, post_height);
    $fence_post_distance           = resolve_param($fence_post_distance, post_distance);
    $fence_post_reference_absolute = resolve_param($fence_post_reference_absolute, post_reference_absolute);
    $fence_post_reference_relative = resolve_param($fence_post_reference_relative, post_reference_relative);
    $fence_post_from_offset        = resolve_param($fence_post_from_offset, post_from_offset);
    $fence_post_to_offset          = resolve_param($fence_post_to_offset, post_to_offset);
    $fence_post_at_start           = resolve_param($fence_post_at_start, post_at_start);
    $fence_post_at_end             = resolve_param($fence_post_at_end, post_at_end);

    $fence_rail_thickness          = resolve_param($fence_rail_thickness, rail_thickness);
    $fence_rail_width              = resolve_param($fence_rail_width, rail_width);
    $fence_rail_pos_z              = resolve_param($fence_rail_pos_z, rail_pos_z);
   
    rotate_if(!$fence_printable && is_top_level, 90, [1, 0]) {
       
        fence();
   
        if($children > CHILD_INDEX_NEXT_SEGMENT) {
            translate([$fence_length, $fence_slope]) {
                children(CHILD_INDEX_NEXT_SEGMENT);
            }
        }
        if($children > CHILD_INDEX_PREVIOUS_SEGMENT) {
            assert($fence_mirror == false);
            mirror([1, 0]) {
                $fence_mirror = true;
                children(CHILD_INDEX_PREVIOUS_SEGMENT);
            }
        }
    }
   
    module fence() {
        rails();

        post_x_reference = $fence_post_reference_absolute + $fence_length * $fence_post_reference_relative;
        post_x_start     = post_x_reference
                         - (floor(
                            (post_x_reference - $fence_post_from_offset)
                            / $fence_post_distance
                         ) * $fence_post_distance);
        post_x_end       = post_x_reference
                         + floor(
                            ($fence_length - $fence_post_to_offset - post_x_reference)
                            / $fence_post_distance
                         ) * $fence_post_distance;
        tangent = $fence_slope / $fence_length;
        for (x = [post_x_start : $fence_post_distance : post_x_end]) {
            translate([x, x * tangent]) post();
        }
        if ($fence_post_at_start) {
            translate([0, 0]) post();
        }
        if ($fence_post_at_end) {
            translate([$fence_length, $fence_length * tangent]) post();
        }

        module rails() {
            linear_extrude($fence_rail_thickness) {
                for (z = $fence_rail_pos_z) {
                    hull() {
                        translate([0, z]) {
                            circle(d = $fence_rail_width);
                        }
                        translate([$fence_length, z + $fence_slope]) {
                            circle(d = $fence_rail_width);
                        }
                    }
                }
            }
        }

        module post() {
            linear_extrude($fence_post_thickness) {
                translate([0, $fence_post_height / 2]){
                    square([$fence_post_width, $fence_post_height], center = true);

                }
            }
        }
    }
}

module fence_bend(
    angle,
    radius,
    rail_thickness,
    rail_width,
    rail_pos_z,
) {
    CHILD_INDEX_NEXT_SEGMENT = 0;
   
    $fence_angle  = resolve_param($fence_angle,  angle);
    $fence_radius = resolve_param($fence_radius, radius);
    
    $fence_rail_thickness          = resolve_param($fence_rail_thickness, rail_thickness);
    $fence_rail_width              = resolve_param($fence_rail_width, rail_width);
    $fence_rail_pos_z              = resolve_param($fence_rail_pos_z, rail_pos_z);
    
    is_top_level = is_undef($fence_printable);
    assert(is_top_level || is_undef(printable),
        "Parameter 'printable' can only be set on top level");
    
    if($fence_printable) {
        r = $fence_rail_thickness / 2 + $fence_radius;
        l = 2 * PI * r * ($fence_angle / 360);
        
        linear_extrude($fence_rail_thickness) {
            for (z = $fence_rail_pos_z) {
                hull() {
                    translate([0, z]) {
                        circle(d = $fence_rail_width);
                    }
                    translate([l, z + $fence_slope]) {
                        circle(d = $fence_rail_width);
                    }
                }
            }
        }
        
        if($children > CHILD_INDEX_NEXT_SEGMENT) {
            translate([l, 0, 0]) {
                children(CHILD_INDEX_NEXT_SEGMENT);
            }
        }
    } else {
        rotate_if(!$fence_printable && is_top_level, 90, [1, 0]) {
       
            if($children > CHILD_INDEX_NEXT_SEGMENT) {
                translate([0,0,-$fence_radius])
                rotate($fence_angle, [0, 1, 0])
                translate([0,0,$fence_radius]) {
                    children(CHILD_INDEX_NEXT_SEGMENT);
                }
            }
        }
    }
}

module fence_stairs(
    length,
    height_offset
) {
}

function resolve_param(special_var, var, default = undef) = (
    (!is_undef(var)) ? (
        var
    ) : (!is_undef(special_var)) ? (
        special_var
    ) : (
        default
    )
);


module lined(thickness = 1) {
    difference() {
        offset(r = thickness) offset(-thickness)
        children();
        offset(-thickness) children();
    }
}

module mirror_if(predicate, vec) {
    if (predicate) {
        mirror(vec) children();
    } else {
        children();
    }
}

module rotate_if(predicate, a, vec) {
    if (predicate) {
        rotate(a, vec) children();
    } else {
        children();
    }
}