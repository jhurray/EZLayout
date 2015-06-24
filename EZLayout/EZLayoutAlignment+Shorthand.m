//
//  EZLayoutAlignment+Shorthand.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutAlignment+Shorthand.h"

@implementation EZLayoutAlignment (Shorthand)

/*
 P -> Percentage
 
 F -> Fixed Length
 
 */

#pragma mark - P

+ (instancetype) ezs_tP:(CGFloat)tP {
    return [self topPercentage:tP];
}

+ (instancetype) ezs_bP:(CGFloat)bP {
    return  [self bottomPercentage:bP];
}

+ (instancetype) ezs_lP:(CGFloat)lP {
    return [self leftPercentage:lP];
}

+ (instancetype) ezs_rP:(CGFloat)rP {
    return [self rightPercentage:rP];
}

+ (instancetype) ezs_tP:(CGFloat)tP lP:(CGFloat)lP {
    return [self topPercentage:tP leftPercentage:lP];
}

+ (instancetype) ezs_tP:(CGFloat)tP rP:(CGFloat)rP {
    return [self topPercentage:tP rightPercentage:rP];
}

+ (instancetype) ezs_bP:(CGFloat)bP lP:(CGFloat)lP {
    return [self bottomPercentage:bP leftPercentage:lP];
}

+ (instancetype) ezs_bP:(CGFloat)bP rP:(CGFloat)rP {
    return [self bottomPercentage:bP rightPercentage:rP];
}


#pragma mark - F

+ (instancetype) ezs_tF:(CGFloat)tF {
    return [self topFixed:tF];
}

+ (instancetype) ezs_bF:(CGFloat)bF {
    return [self  bottomFixed:bF];
}

+ (instancetype) ezs_lF:(CGFloat)lF {
    return [self leftFixed:lF];
}

+ (instancetype) ezs_rF:(CGFloat)rF {
    return [self rightFixed:rF];
}

+ (instancetype) ezs_tF:(CGFloat)tF lF:(CGFloat)lF {
    return [self topFixed:tF leftPercentage:lF];
}

+ (instancetype) ezs_tF:(CGFloat)tF rF:(CGFloat)rF {
    return [self topFixed:tF rightFixed:rF];
}

+ (instancetype) ezs_bF:(CGFloat)bF lF:(CGFloat)lF {
    return [self  bottomFixed:bF leftFixed:lF];
}

+ (instancetype) ezs_bF:(CGFloat)bF rF:(CGFloat)rF {
    return [self  bottomFixed:bF rightFixed:rF];
}

#pragma mark - P + F

+ (instancetype) ezs_tP:(CGFloat)tP lF:(CGFloat)lF {
    return [self topPercentage:tP leftFixed:lF];
}

+ (instancetype) ezs_tF:(CGFloat)tF lP:(CGFloat)lP {
    return [self topFixed:tF leftPercentage:lP];
}

+ (instancetype) ezs_tP:(CGFloat)tP rF:(CGFloat)rF {
    return [self topPercentage:tP rightFixed:rF];
}

+ (instancetype) ezs_tF:(CGFloat)tF rP:(CGFloat)rP {
    return [self topFixed:tF rightPercentage:rP];
}

+ (instancetype) ezs_bP:(CGFloat)bP lF:(CGFloat)lF {
    return [self  bottomPercentage:bP rightFixed:lF];
}

+ (instancetype) ezs_bF:(CGFloat)bF lP:(CGFloat)lP {
    return [self bottomFixed:bF leftPercentage:lP];
}

+ (instancetype) ezs_bP:(CGFloat)bP rF:(CGFloat)rF {
    return [self bottomPercentage:bP rightFixed:rF];
}

+ (instancetype) ezs_bF:(CGFloat)bF rP:(CGFloat)rP {
    return  [self bottomFixed:bF rightPercentage:rP];
}

@end
