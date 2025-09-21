use <Utils.scad>

M3HexHole_Horizontal();

module M3HexHole_Horizontal(l1 = 1.0, l2 = 5.0, layer_height = 0.15) {
    HexNutHoleHorizontal(
        hole_diameter = 3.0,
        nut_diameter  = 5.5,
        nut_height    = 2.4,
        l1            = l1,
        l2            = l2);
}

module HexNutHoleHorizontal(
    hole_diameter, nut_diameter, nut_height, l1, l2, layer_height = 0.15, $fn=32
) {
    linear_extrude(nut_height) {
        Hex(nut_diameter);
    }
    linear_extrude(nut_height + layer_height) {
        intersection() {
            square([hole_diameter, nut_diameter], center=true);
            Hex(nut_diameter);
        }
    }
    mirror([0, 0, 1]) cylinder(d = hole_diameter, l1);
    cylinder(d = hole_diameter, l2 + nut_height);
}