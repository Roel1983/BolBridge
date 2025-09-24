use <Utils.scad>

M3HexHole_Horizontal(slide = 1);

module M3HexHole_Horizontal(l1 = 1.0, l2 = 5.0, layer_height = 0.15, slide = 0, height_tolerance = undef) {
    HexNutHoleHorizontal(
        hole_diameter = 3.0,
        nut_diameter  = 5.5,
        nut_height    = 2.4,
        l1            = l1,
        l2            = l2,
        layer_height  = layer_height,
        slide         = slide,
        height_tolerance = height_tolerance);
}

module HexNutHoleHorizontal(
    hole_diameter, nut_diameter, nut_height, l1, l2, layer_height = 0.15, slide = 0, height_tolerance = undef, $fn=32
) {
    height = nut_height + (
        (height_tolerance == undef) ? (
            (slide == 0) ? 0 : layer_height
        ) : (
            height_tolerance
        )
    );
    linear_extrude(height) {
        if(slide == 0) { 
            Hex(nut_diameter);
        } else {
            hull() {
                Hex(nut_diameter);
                translate([slide, 0, 0]) Hex(nut_diameter);
            }
        }
    }
    linear_extrude(height + layer_height) {
        intersection() {
            square([hole_diameter, nut_diameter], center=true);
            Hex(nut_diameter);
        }
    }
    linear_extrude(height + 2 * layer_height) {
        square(hole_diameter, center=true);
    }
    mirror([0, 0, 1]) cylinder(d = hole_diameter, l1);
    cylinder(d = hole_diameter, l2 + height);
}