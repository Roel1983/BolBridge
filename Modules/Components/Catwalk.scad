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
    support_count = 7
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

    support_to_offset = 1;    
    support_from = beam_outer - 2;
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
            HBar(
                from = [0, support_from],
                to   = [0, support_to],
                width = support_width,
                height = 2.5
            );
        }
        
        module Distribute() {
            start = 1;
            step  = 2;
            end   = support_count * 2;
            for (i = [start:step:end]) {
                translate([
                    beam_from + ((beam_len) * i / end),
                    0
                ]) {
                    children();
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
            linear_extrude(beam_bottom_face_thickness + .6) {
                square([0.8, distance], center = true);
            }
            
            module PerpendicularSupport() {
                width = 0.8;
                linear_extrude(beam_bottom_face_thickness) {
                    square([support_distance, width], true);
                }
                hull() {
                    linear_extrude(beam_bottom_face_thickness) {
                        square([support_distance - support_width - 1, width], true);
                    }
                    linear_extrude(beam_bottom_face_thickness + .8) {
                        square([support_distance - support_width - 6, width], true);
                    }
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