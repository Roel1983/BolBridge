/**
 * High-Level: Provides utilities for generating complex 3D meshes from 
 * structured point data.
 */

// --- Example Usage ---
// Creates a triangular tube with 3 rings.
// The first two rings are identical, and the third is smaller.

triangle_pts = [
    [0, 10, 0], [8.6, -5, 0], [-8.6, -5, 0], // Ring 1 (z=0)
    [0, 10, 20], [8.6, -5, 20], [-8.6, -5, 20], // Ring 2 (z=20)
    [0, 5, 40], [4.3, -2.5, 40], [-4.3, -2.5, 40] // Ring 3 (z=40, scaled 0.5)
];
Loft(triangle_pts, 3);


/**
 * Calculates the faces for a lofted polyhedron.
 *
 * @param points_count Total number of points in the flat list.
 * @param points_per_ring The number of vertices in each ring.
 * @param caps If true, generates faces for the first and last rings.
 * @param closed_loop If true, connects the last vertex of each ring back to the first.
 * @return A list of faces (each face is a list of vertex indices).
 */
function get_loft_faces(points_count, points_per_ring, caps = true, closed_loop = true) = let(
    num_rings = points_count / points_per_ring,
    
    // 1. Cap Faces
    top_face    = caps ? [[for (i = [points_per_ring - 1 : -1 : 0]) i]] : [],
    bottom_face = caps ? [[for (i = [0 : points_per_ring - 1]) points_count - points_per_ring + i]] : [],

    // 2. Side Faces (Quads between rings)
    side_faces = [
        for (r = [0 : num_rings - 2]) 
        for (i = [0 : points_per_ring - 1]) 
        if (closed_loop || i < points_per_ring - 1)
        let(
            i_next = (i + 1) % points_per_ring,
            r_now  = r * points_per_ring,
            r_next = (r + 1) * points_per_ring
        )
        [
            r_now + i, 
            r_now + i_next, 
            r_next + i_next, 
            r_next + i
        ]
    ]
) concat(top_face, side_faces, bottom_face);

/**
 * Creates a polyhedron by "skinning" or "lofting" through multiple rings of points.
 *
 * @param points A flat list of points [v1, v2, ..., vk] where k = num_rings * points_per_ring.
 * @param points_per_ring The number of vertices in each ring.
 * @param convexity The convexity parameter for the polyhedron.
 */
module Loft(points, points_per_ring, convexity = 10) {
    assert(len(points) % points_per_ring == 0, "Total points must be a multiple of points per ring");
    
    faces = get_loft_faces(
        points_count    = len(points), 
        points_per_ring = points_per_ring, 
        caps            = true, 
        closed_loop     = true
    );

    polyhedron(points = points, faces = faces, convexity = convexity);
}