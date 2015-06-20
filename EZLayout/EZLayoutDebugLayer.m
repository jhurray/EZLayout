//
//  EZLayoutDebugLayer.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/26/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZLayoutDebugLayer.h"

@implementation EZLayoutDebugLayer

+ (instancetype) debugLayerWithFrame:(CGRect)frame {
    
    EZLayoutDebugLayer *layer = [[EZLayoutDebugLayer alloc] init];
    layer.lineWidth = 2.5;
    frame.size.width-=3.5;
    frame.size.height-=3.5;
    frame.origin.x/=2.0;
    frame.origin.x+=1;
    frame.origin.y/=2.0;
    frame.origin.y+=1;
    layer.frame = frame;
    layer.strokeColor = [UIColor grayColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineDashPattern = @[@2.5, @2.5];
    layer.path = [UIBezierPath bezierPathWithRect:frame].CGPath;
    return layer;
}

+ (void) removeAllFromView:(UIView *)view {
    NSMutableArray *layersForDeletion = [NSMutableArray new];
    for (CALayer *layer in view.layer.sublayers) {
        if ([layer isKindOfClass:[EZLayoutDebugLayer class]]) {
            [layersForDeletion addObject:layer];
        }
    }
    for (EZLayoutDebugLayer *layer in layersForDeletion) {
        [layer removeFromSuperlayer];
    }
}

@end
