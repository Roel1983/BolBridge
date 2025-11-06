include <../../Config.inc>
use <../Utils/Bar.scad>
use <../Utils/Utils.scad>
include <LongbeamBottomFace.inc>

Catwalk(
    beam_inner = -10,
    beam_outer =  10,
    beam_from  = -100,
    beam_to    =  100,
    beam_bottom_face_thickness = 1,
    support_count = 22
);

module Catwalk(
    beam_inner,
    beam_outer,
    beam_from,
    beam_to,
    beam_bottom_face_thickness,
    catwalk_from_offset = 0,
    catwalk_to_offset   = 0,
    support_count,
    support_every_odd
) {
    catwalk_floor_gap       =  1.0;
    catwalk_floor_width     = 10.0;
    catwalk_floor_thickness = 0.5;
    
    beam_len   = beam_to - beam_from;
    
    catwalk_outer  = beam_inner - catwalk_floor_gap;
    catwalk_inner  = catwalk_outer - catwalk_floor_width;
    catwalk_center = (catwalk_outer + catwalk_inner) / 2;
    catwalk_from   = beam_from + catwalk_from_offset;
    catwalk_to     = beam_to   - catwalk_to_offset;
    catwalk_len    = catwalk_to - catwalk_from;

    support_to_offset = 0;    
    support_from = beam_outer - 0;
    support_to   = catwalk_inner + support_to_offset;
    support_distance = beam_len / support_count;
    support_width = 2.0;
    
    CatwalkTopSurface();
    Supports();
    PerpendicularSupportPairs();
    
    module CatwalkTopSurface() {
        translate([0,0,-beam_bottom_face_thickness]) {
            linear_extrude(catwalk_floor_thickness) {
                polygon([
                    [catwalk_from, catwalk_inner],
                    [catwalk_to,   catwalk_inner],
                    [catwalk_to,   catwalk_outer],
                    [catwalk_from, catwalk_outer]
                ]);
            }
        }
    }
    
    module Supports() {
        Distribute() Support();
    
        module Support() {
            width  = 1.5;
            height = 1.5;
            thickness = 0.4;
            
            rotate(-90, [0, 1, 0]) {
                linear_extrude(thickness, center=true) {
                    polygon([
                        [0, support_from],
                        [thickness, support_from],
                        [height, support_from - height],
                        [height, support_to],
                        [0, support_to]
                    ]);
                }
            }
            linear_extrude(0.4) {
                polygon([
                    [-width/2, support_from],
                    [ width/2, support_from],
                    [ width/2, support_to],
                    [-width/2, support_to]
                ]);
            }
        }
        
        module Distribute() {
            start = 0;
            step  = 1;
            end   = support_count + 1;
            for (i = [start:step:end]) {
                x = beam_from + ((beam_len) * i / support_count);
                if (x > catwalk_from && x < catwalk_to) {
                    translate([
                        x,
                        0
                    ]) {
                        children();
                    }
                }
            }
        }
    }
    
    module PerpendicularSupportPairs() {
        intersection() {
            Distribute() PerpendicularSupportPair();
            BoundingBox();
        }
        
        module PerpendicularSupportPair() {
            distance = (catwalk_floor_width - 0.8) - 2 * support_to_offset;
            mirror_copy([0,1,0]) {
                translate([0, distance / 2]) {
                    PerpendicularSupport();
                }
            }
            
            module PerpendicularSupport() {
                width = 0.8;
                linear_extrude(beam_bottom_face_thickness) {
                    square([support_distance, width], true);
                }
                linear_extrude(beam_bottom_face_thickness) {
                    square([support_distance - support_width - 1, width], true);
                }
            }
        }
        
        module Distribute() {
            start = 0;
            step  = 2;
            end   = support_count * 2;
            for (i = [start:step:end]) {
                translate([
                    beam_from + ((beam_len) * i / end),
                    catwalk_center,
                    -beam_bottom_face_thickness
                ]) {
                    children();
                }
            }
        }
        
        module BoundingBox() {
            offset = 1.0;
            translate([0,0,-beam_bottom_face_thickness]) {
                linear_extrude(catwalk_floor_thickness + 1.0) {
                    polygon([
                        [catwalk_from + offset, catwalk_inner],
                        [catwalk_to   - offset,   catwalk_inner],
                        [catwalk_to   - offset,   catwalk_outer],
                        [catwalk_from + offset, catwalk_outer]
                    ]);
                }
            }
        }
    }
    
    
    
    
}