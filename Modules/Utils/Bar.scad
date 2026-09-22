include <Utils.scad>
include <PolygonTube.scad>

HBarProfile(
    length    = [3, 10],
    width     = 3,
    height    = [4,4,2.5],
    thickness = 0.4,
    overhang  = 60
);

module HBarProfile(
    length    = [3, 10],
    width     = 3,
    height    = [4,4,2.5],
    thickness = 0.4,
    overhang  = 60
) {
    ring_count = (is_list(length) ? len(length) : 1) + 1;
    points = [
        each for (
            i = [0 : ring_count - 1]
        ) [
            for (
                p2D = HBarProfile_points(
                    getNum(width, i),
                    getNum(height, i),
                    getNum(thickness, i),
                    getNum(overhang, i)
                 )
            ) [
                p2D.x,
                i == 0 ? 0 : (is_num(length)?length:length[i - 1]),
                p2D.y
            ]
        ]
    ];
    ring_node_count = len(points) / ring_count;
    
    PolygonTube(points, ring_node_count);

    function HBarProfile_points(
        width     = 3,
        height    = 3,
        thickness = 0.4,
        overhang  = 60
    ) = (
        let(a         = (width - thickness) / 2 * tan(90 - overhang))
        [
            [-width/2, 0],
            [-width/2, -thickness],
            [-thickness, -thickness - a],
            [-thickness, -height + thickness + a],
            [-width/2, -height + thickness],
            [-width/2, -height],
            [ width/2, -height],
            [ width/2, -height + thickness],
            [ thickness, -height + thickness + a],
            [ thickness, -thickness - a],
            [ width/2, -thickness],
            [ width/2, 0],
        ]
    );
}


