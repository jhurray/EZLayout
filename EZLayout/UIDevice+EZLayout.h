//
//  UIDevice+EZLayout.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (EZLayout)

+ (CGFloat) currentHeight;
+ (CGFloat) currentWidth;
+ (BOOL) isLandscape;
+(BOOL) isPortrait;

@end
