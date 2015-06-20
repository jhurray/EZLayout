//
//  UIView+EZLayout_Private.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/24/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EZLayout_Private)

- (void) calculateSizeAndAlignmentValuesInContainerRect:(CGRect) containerRect;
- (void) calculateViewInContainerRect:(CGRect) containerRect;

@end
