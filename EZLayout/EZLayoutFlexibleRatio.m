//
//  EZLayoutFlexibleRatio.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/16/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutFlexibleRatio.h"

@implementation EZLayoutFlexibleRatio

+ (instancetype) withRatio:(CGFloat)ratio {
    EZLayoutFlexibleRatio *flexRatio = [[EZLayoutFlexibleRatio alloc] init];
    flexRatio.ratio = ratio;
    return flexRatio;
}

@end
