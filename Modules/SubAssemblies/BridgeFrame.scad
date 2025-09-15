include <Portal_Front.inc>
include <Portal_Back.inc>

BridgeFrame();

module BridgeFrame() {
    Portal_Front_LocRot_BridgeFrame() Portal_Front();
    Portal_Back_LocRot_BridgeFrame()  Portal_Back();
}