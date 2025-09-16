include <Portal_Front.inc>
include <Portal_Back.inc>
include <Truss_Left.inc>

BridgeFrame();

module BridgeFrame() {
    Portal_Front_LocRot_BridgeFrame() Portal_Front();
    Portal_Back_LocRot_BridgeFrame()  Portal_Back();
    Truss_Left_LocRot_BridgeFrame()   Truss_Left();
}