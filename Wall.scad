
module Wall(
        points,
        thickness                 = 1,
        angles                    = undef,
        offsets                   = undef,
        angled_offsets            = undef,
        glue_crack                = 0.1,
        glue_crack_relative_depth = 0.5,
        glue_crack_depth          = undef
) {
    use_glue_crack_depth = (!is_undef(glue_crack_depth)) ? (
        glue_crack_depth
    ) : (
        thickness * glue_crack_relative_depth
    );
    assert(is_num(use_glue_crack_depth) && use_glue_crack_depth >= 0 && use_glue_crack_depth < thickness);
    
    top_offsets = [for (i=[0:len(points)-1]) (
        get_value_from_list(offsets, i, 0)
        + get_value_from_list(angled_offsets, i, 0) / cos(get_value_from_list(angles, i, 0))
    )];
    top_points = [for(p = get_offset_polygon_2d(points, -top_offsets)) [
        p[0], p[1], 0]];
    
    middle_offsets = [for (i=[0:len(points)-1]) (
        top_offsets[i]
        + use_glue_crack_depth * tan(get_value_from_list(angles, i, 0))
    )];
    middle_points = [for(p = get_offset_polygon_2d(points, -middle_offsets)) [
        p[0], p[1], -use_glue_crack_depth]];
    
    bottom_offsets = [for (i=[0:len(points)-1]) (
        top_offsets[i]
        + thickness * tan(get_value_from_list(angles, i, 0))
        - get_value_from_list(glue_crack, i, 0)
    )];
    bottom_points = [for(p = get_offset_polygon_2d(points, -bottom_offsets)) [
        p[0], p[1], -thickness]];
    
    points = concat(top_points, middle_points, bottom_points);
    
    top_face    = [for(i=[len(bottom_points)-1:-1:0])i];
    bottom_face = [for(i=[0:len(top_points)-1])len(top_points)*2+i];
    side_faces  = [for(j=[0:1], i=[0:len(top_points)-1])
        [
            (len(top_points)*j) + (i + 0),
            (len(top_points)*j) + (i + 1) % len(top_points),        
            (len(top_points)*j) + (i + 1) % len(top_points) + len(top_points),
            (len(top_points)*j) + (i + 0) + len(top_points)
        ]
    ];
    faces = concat([top_face], side_faces, [bottom_face]);
    render() polyhedron(points, faces, convexity=3);
}

function get_offset_intersection_2d(p1, p2, p3, offset1, offset2) =
    let (
        v1 = p2 - p1, // Vector from p1 to p2
        v2 = p3 - p2, // Vector from p2 to p3

        n1_unnorm = [-v1[1], v1[0]],
        n2_unnorm = [-v2[1], v2[0]],

        offset_vec1 = n1_unnorm / norm(n1_unnorm) * offset1,
        offset_vec2 = n2_unnorm / norm(n2_unnorm) * offset2,

        p1_offset          = p1 + offset_vec1,
        p2_on_line1_offset = p2 + offset_vec1,
        p2_on_line2_offset = p2 + offset_vec2,
        p3_offset          = p3 + offset_vec2,

        a1 = p2_on_line1_offset[1] - p1_offset[1],
        b1 = p1_offset[0] - p2_on_line1_offset[0],
        c1 = a1 * p1_offset[0] + b1 * p1_offset[1],

        a2 = p3_offset[1] - p2_on_line2_offset[1],
        b2 = p2_on_line2_offset[0] - p3_offset[0],
        c2 = a2 * p2_on_line2_offset[0] + b2 * p2_on_line2_offset[1],

        det = a1 * b2 - a2 * b1
    )
    (abs(det) < 1e-9) ? undef :
    [
        (c1 * b2 - c2 * b1) / det,
        (a1 * c2 - a2 * c1) / det
    ];

function get_offset_polygon_2d(points, offsets) = (
    [ for (i = [0 : len(points) - 1]) (
        let (
            i0 = (i + len(points) - 1) % len(points),
            i1 = i,
            i2 = (i + 1) % len(points),
            p0 = points[i0],
            p1 = points[i1],
            p2 = points[i2],
            offset1 = offsets[i0],
            offset2 = offsets[i1]
        )
        get_offset_intersection_2d(p0, p1, p2, offset1, offset2)
    )]
);

function get_value_from_list(list, index, default) = (
    (is_num(list)) ? (
        list
    ) : (is_list(list) && len(list) > index) ? (
        list[index]
    ) : (
        default
    )
);