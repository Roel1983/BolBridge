railing_bottom = -2;
railing_top    = 10;

length = 80;
railing = [
    [-2.5, [0.4, 1.0]],
    [ 4.0, [0.4, 0.4]],
    [ 9.8, [0.4, 0.4]]
];
for (r = railing) {
    pos  = r[0];
    size = r[1];
    translate([0, pos]) {
        linear_extrude(size.x) {
            square([
                length,
                size.y
            ], true);
        }
    }
}

Pillars();

module Pillars() {
    distance = 8;
    count    = 10;
    for(i = [-(count - 1) / 2:(count - 1) / 2]) {
        translate([i * distance, 0]) {
            Pillar();
        }
    }

    module Pillar(
        width     = 2,
        thickness = 1,
        bottom    = -4,
        top       = 10,
        bevel     = [1,1]
    ) {
        assert(top > bottom);
        assert(bevel.x <= width);
        assert(bevel.y <= top - bottom);
        
        rotate(-90, [0, 1, 0]) {
            linear_extrude(thickness, center = true) {
                polygon([
                    [0, bottom],
                    [width, bottom],
                    [width, top - bevel.y],
                    [width - bevel.x, top],
                    [0, top]
                ]);
            }
        }
    }
}