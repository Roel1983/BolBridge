
RoundedRectangle([30, 20], 5, $fn=32);

module RoundedRectangle(size, radius) {
    minkowski() {
        square([size.x - 2 * radius, 
                size.y - 2 * radius], true);
        circle(radius);
    }
}
