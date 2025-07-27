module mirror_copy(vec=undef) {
    children();
    mirror(vec) children();
}

function dot_product(v1, v2) =
    let(
        max_dim = max(len(v1), len(v2)),
        v1_eff = len(v1) < max_dim ? concat(v1, [for (i = [0 : max_dim - len(v1) - 1]) 0]) : v1,
        v2_eff = len(v2) < max_dim ? concat(v2, [for (i = [0 : max_dim - len(v2) - 1]) 0]) : v2
    )
    (max_dim == 2) ? (v1_eff[0]*v2_eff[0] + v1_eff[1]*v2_eff[1]) :
    (max_dim == 3) ? (v1_eff[0]*v2_eff[0] + v1_eff[1]*v2_eff[1] + v1_eff[2]*v2_eff[2]) :
    0;

function mirror_single_point(p, n) =
    let(
        p_dim = len(p),
        p_calc = (p_dim == 2 && len(n) == 3) ? [p[0], p[1], 0] : p,
        n_calc = (len(n) == 2 && p_dim == 3) ? [n[0], n[1], 0] : n,
        n_norm = (norm(n_calc) == 0) ? n_calc : n_calc / norm(n_calc),
        proj_scalar = dot_product(p_calc, n_norm),
        reflection_vec = [
            2 * proj_scalar * n_norm[0],
            2 * proj_scalar * n_norm[1],
            (len(n_norm) == 3 ? 2 * proj_scalar * n_norm[2] : 0) 
        ]
    )
    (p_dim == 2) ? [
        p[0] - reflection_vec[0],
        p[1] - reflection_vec[1]
    ] : [
        p[0] - reflection_vec[0],
        p[1] - reflection_vec[1],
        p[2] - reflection_vec[2]
    ];


function copy_mirror_points(points, vec = [1, 0, 0]) =
    let(
        mirrored_points = [ for (p = points) mirror_single_point(p, vec) ],
        reversed_mirrored_points = [
            for (i = [len(mirrored_points) - 1 : -1 : 0]) mirrored_points[i]
        ]
    )
    // Step 3: Concatenate the original points with the reversed and mirrored points
    concat(points, reversed_mirrored_points);

module Hex(d) {
    intersection_for(a = [0, 120, 240]) rotate(a) square([d * 2, d], true);
}
        