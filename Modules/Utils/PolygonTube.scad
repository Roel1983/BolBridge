
module PolygonTube(points, points_per_ring) {
    ring_count = len(points) / points_per_ring;
    assert(len(points) == ring_count * points_per_ring);
    
    front_faces = [range(
        points_per_ring - 1,
        0
    )];
    back_faces = [range(
        points_per_ring * (ring_count - 1),
        points_per_ring * ring_count - 1
    )];
    side_faces = [
        each for (ring = [0 : ring_count - 2]) [
            for (point = [0 : points_per_ring - 1]) [
                point + (ring + 0) * points_per_ring,
                (point + 1) % points_per_ring + (ring + 0) * points_per_ring,
                (point + 1) % points_per_ring + (ring + 1) * points_per_ring,
                point + (ring + 1) * points_per_ring,
            ]
        ]
    ];
    faces = concat(front_faces, back_faces, side_faces);
    polyhedron(points, faces);
}