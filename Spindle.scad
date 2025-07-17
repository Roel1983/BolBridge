include <Config.inc>

include <Spindle.inc>

SpindleRotLoc([0,1,2,3]) Spindle();

module SpindleRotLoc(index = 0) {
    for(i = is_num(index)?[index]:is_list(index)?index:[]) {
        if (i == 0) {
            translate([ front_spindle_center,  side_spindle_center]) children();
        } else if (i == 1) {
            translate([-front_spindle_center,  side_spindle_center]) children();
        } else if (i == 2) {
            translate([-front_spindle_center, -side_spindle_center]) children();
        } else if (i == 3) {
            translate([ front_spindle_center, -side_spindle_center]) children();
        } else {
            echo(str("SpindleRotLoc(", index, "). Invalid 'index'"));
        }
    }
}

module Spindle() {
    cylinder(d=spindle_diameter, h=100, $fn=32);
}