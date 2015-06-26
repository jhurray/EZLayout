//
//  UIDevice+EZLayout.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "UIDevice+EZLayout.h"

@implementation UIDevice (EZLayout)

+(CGSize) currentSize
{
    return [UIDevice sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIApplication *application = [UIApplication sharedApplication];
    if (application.statusBarHidden == NO)
    {
        size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
    }
    return size;
}

+ (CGFloat) currentHeight {
    return [self currentSize].height;
}

+ (CGFloat) currentWidth {
    return [self currentSize].width;
}

+ (BOOL) isLandscape {
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

+(BOOL) isPortrait {
    return ![self isLandscape];
}

@end
