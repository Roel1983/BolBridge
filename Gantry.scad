include <ShortbeamBottomFace.inc>
include <LongbeamBottomFace.inc>
include <LongbeamTopFace.inc>
include <LongbeamInnerFace.inc>
include <ShortbeamTopFace.inc>
include <GateFrontFace.inc>
include <TowerOuterFace.inc>
include <TowerInnerFace.inc>

pair = 0; // [45]


test_intersection() {
    color("Purple") ShortbeamBottomFaceRotLoc([0,1]) ShortbeamBottomFace();
    color("Brown")  LongbeamBottomFaceRotLoc([0,1]) LongbeamBottomFace();
    color("pink")   LongbeamTopFaceRotLoc([0,1]) LongbeamTopFace();
    color("Cyan")   LongbeamInnerFaceRotLoc([0,1,2,3]) LongbeamInnerFace();
    color("Yellow") translate([0.1,0])ShortbeamTopFaceRotLoc([0,1]) ShortbeamTopFace();
    color("Red")    GateFrontFaceRotLoc([0,1]) GateFrontFace();
    color("Red")    GateBackFaceRotLoc([0,1]) GateBackFace();
    color("Blue")   TowerOuterFaceRotLoc([0,1,2,3]) TowerOuterFace();
    color("Green")  TowerInnerFaceRotLoc([0,1,2,3]) TowerInnerFace();
}

module test_intersection() {
    total_pairs = ($children - 1) * $children / 2;
    color("Red") for(i = [0 : total_pairs - 1]) {
        pair = get_unique_pair_geometric($children-1, i);
        echo(i=i, pair=pair);
        render() intersection() {
            children(pair[0]);
            children(pair[1]);
        }
    }
    color("Green", alpha=0.25)render() for(i = [0 : $children - 1]) {
       children(i);
    }
    
}

function get_unique_pair_geometric(n, index) = 
    let(
        total_pairs = (n + 1) * n / 2,
        wrapped_index = (floor(index) % total_pairs + total_pairs) % total_pairs,
        discriminant = pow(2*n + 1, 2) - 8 * wrapped_index,
        a = floor(( (2*n + 1) - sqrt(discriminant) ) / 2),
        base_index_for_a = (a == 0) ? 0 : a * (2*n - a + 1) / 2,
        offset_in_block = wrapped_index - base_index_for_a,
        b = a + 1 + offset_in_block
    )
    [a, b];