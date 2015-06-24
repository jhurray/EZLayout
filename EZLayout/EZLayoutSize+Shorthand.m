//
//  EZLayoutSize+Shorthand.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutSize+Shorthand.h"

@implementation EZLayoutSize (Shorthand)

// Dynamic
+ (instancetype)  ezs_hP:(CGFloat) hP  wP:(CGFloat) wP {
    return [self heightPercentage:hP widthPercentage:wP];
}

+ (instancetype)  ezs_hP:(CGFloat) hP scale:(CGFloat)scale {
    return [self heightPercentage:hP scaleFactor:scale];
}

+ (instancetype)  ezs_wP:(CGFloat) wP scale:(CGFloat)scale {
    return [self widthPercentage:wP scaleFactor:scale];
}


// Fixed
+ (instancetype) ezs_hF:(CGFloat)hF wF:(CGFloat)wF {
    return [self heightFixed:hF widthFixed:wF];
}


// Fixed + Dynamic
+ (instancetype) ezs_hF:(CGFloat)hF  wP:(CGFloat) wP {
    return [self heightFixed:hF widthPercentage:wP];
}

+ (instancetype) ezs_wF:(CGFloat)wF  hP:(CGFloat) hP {
    return [self widthFixed:wF heightPercentage:hP];
}

@end
