//
//  EZLayoutSize+Shorthand.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutSize.h"

typedef EZLayoutSize EZSize;

@interface EZLayoutSize (Shorthand)

/*
 h -> Height
 
 w -> Width
 
scale -> scaleFactor
 
 P -> Percentage
 
 F -> Fixed Length
 
 */

// Dynamic
+ (instancetype)  ezs_hP:(CGFloat) hP  wP:(CGFloat) wP;
+ (instancetype)  ezs_hP:(CGFloat) hP scale:(CGFloat)scale;
+ (instancetype)  ezs_wP:(CGFloat) wP scale:(CGFloat)scale;

// Fixed
+ (instancetype) ezs_hF:(CGFloat)hF wF:(CGFloat)wF;
// Fixed + Dynamic
+ (instancetype) ezs_hF:(CGFloat)hF  wP:(CGFloat) wP;
+ (instancetype) ezs_wF:(CGFloat)wF  hP:(CGFloat) hP;

@end
