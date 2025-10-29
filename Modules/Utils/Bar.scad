HBar(
    from   = [-10, 10],
    to     = [20,  30],
    width  = 4,
    height = 6
);

module HBar(from, to, width = 3, height = 3, angle = 0) {
    Bar(from, to) rotate(angle) HBarProfile(width, height);
}

module HBarProfile(
    width     = 3,
    height    = 3,
    thickness = 0.4,
    overhang  = 60
) {
    a         = (width - thickness) / 2 * tan(90 - overhang);
    polygon([
        [-width/2, 0],
        [-width/2, thickness],
        [-thickness, thickness + a],
        [-thickness, height - thickness - a],
        [-width/2, height - thickness],
        [-width/2, height],
        [ width/2, height],
        [ width/2, height - thickness],
        [ thickness, height - thickness - a],
        [ thickness, thickness + a],
        [ width/2, thickness],
        [ width/2, 0],
    ]);
}

module Bar(from, to) {
    translate(from) {
        rotate(atan2(to.x-from.x, from.y-to.y)) {
            rotate(90, [1, 0, 0]) {
                linear_extrude(norm(to - from), convexity=2) {
                    children();
                }
            }
        }
    }
}

