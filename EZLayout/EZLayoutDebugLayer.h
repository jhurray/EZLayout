//
//  EZLayoutDebugLayer.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/26/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface EZLayoutDebugLayer : CAShapeLayer

+ (instancetype) debugLayerWithFrame:(CGRect)frame;
+ (void) removeAllFromView:(UIView *)view;

@end
