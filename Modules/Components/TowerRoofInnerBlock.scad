include <../../Config.inc>

include <TowerOuterSideWall.inc>
include <TowerInnerSideWall.inc>
include <PortalCommon.inc>

include <TowerRoofInnerBlock.inc>

TowerRoofInnerBlock();

towerRoofInnerBlock_tolerance = 0.1;

module TowerRoofInnerBlock() {
    x_from = -tower_size.x / 2 + tower_inner_face_thickness + towerRoofInnerBlock_tolerance;
    x_to   =  tower_size.x / 2 - tower_outer_face_thickness - towerRoofInnerBlock_tolerance;
    
    y_size = tower_size.y - 2 * (portal_wall_thickness + towerRoofInnerBlock_tolerance);
    
    rotate(90, [1, 0, 0]) {
        linear_extrude(y_size, center = true) {
            polygon([
                [x_from, 0],
                [x_from, towerRoofInnerBlock_topHeight - abs(x_from) * tan(tower_roof_angle)],
                [0, towerRoofInnerBlock_topHeight],
                [x_to, towerRoofInnerBlock_topHeight - abs(x_to) * tan(tower_roof_angle)],
                [x_to, 0]
            ]);
        }
    }
}