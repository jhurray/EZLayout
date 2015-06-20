//
//  UIView+EZLayout_Private.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/24/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "UIView+EZLayout.h"
#import "UIView+EZLayout_Private.h"
#import "EZLayoutAlignment+Private.h"
#import "EZLayoutSize+Private.h"

@implementation UIView (EZLayout_Private)

- (void) calculateSizeAndAlignmentValuesInContainerRect:(CGRect)containerRect {
    if (!self.superview) {
        NSAssert(NO, @"EZLayout Fatal Error: Your view should ahve a superview.");
        return;
    }
    if (CGRectEqualToRect(CGRectZero, containerRect)) {
        return;
    }
    //Ratio
    CGFloat containerRatio = containerRect.size.height/containerRect.size.width;
    
    // Calculate Size
    if (self.ezSize.type == EZLayoutSizeTypeHeightAndWidth) {
        CGFloat scaleFactor = self.ezSize.widthPercentage==0? 0:self.ezSize.heightPercentage/self.ezSize.widthPercentage;
        self.ezSize.scaleFactor = scaleFactor;
    }
    else if (self.ezSize.type == EZLayoutSizeTypeHeightAndScale) {
        CGFloat widthPercentage = MIN(1.0, self.ezSize.scaleFactor*self.ezSize.heightPercentage*containerRatio);
        self.ezSize.widthPercentage = widthPercentage;
    }
    else if (self.ezSize.type == EZLayoutSizeTypeWidthAndScale) {
        CGFloat heightPercentage = MIN(1.0, self.ezSize.scaleFactor*self.ezSize.widthPercentage/containerRatio);
        self.ezSize.heightPercentage = heightPercentage;
    }
    else if (self.ezSize.type == EZLayoutSizeTypeFixedHeightAndWidth) {
        CGFloat heightPercentage = MIN(1.0, self.ezSize.fixedHeight/containerRect.size.height);
        self.ezSize.heightPercentage = heightPercentage;
        CGFloat widthPercentage = MIN(1.0, self.ezSize.fixedWidth/containerRect.size.width);
        self.ezSize.widthPercentage = widthPercentage;
        CGFloat scaleFactor = self.ezSize.widthPercentage==0? 0:self.ezSize.heightPercentage/self.ezSize.widthPercentage;
        self.ezSize.scaleFactor = scaleFactor;
    }
    else if (self.ezSize.type == EZLayoutSizeTypeFixedHeight) {
        CGFloat heightPercentage = MIN(1.0, self.ezSize.fixedHeight/containerRect.size.height);
        self.ezSize.heightPercentage = heightPercentage;
        CGFloat scaleFactor = self.ezSize.widthPercentage==0? 0:self.ezSize.heightPercentage/self.ezSize.widthPercentage;
        self.ezSize.scaleFactor = scaleFactor;
    }
    else if (self.ezSize.type == EZLayoutSizeTypeFixedWidth) {
        CGFloat widthPercentage = MIN(1.0, self.ezSize.fixedWidth/containerRect.size.width);
        self.ezSize.widthPercentage = widthPercentage;
        CGFloat scaleFactor = self.ezSize.widthPercentage==0? 0:self.ezSize.heightPercentage/self.ezSize.widthPercentage;
        self.ezSize.scaleFactor = scaleFactor;
    }
    else {
        //NSAssert(NO, @"EZLayout Fatal Error: You need to set at least 2 of the EZLayoutSize properties. See header file.");
    }
    
    // Calculate Alignment
    switch (self.ezAlignment.type) {
        
        case EZLayoutAlignmentTypeCenter:
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.rightPaddingPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.bottomPaddingPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            break;
        case EZLayoutAlignmentTypeTopPercentage:
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.rightPaddingPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomPercentage:
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.rightPaddingPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeLeftPercentage:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.bottomPaddingPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeRightPercentage:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.bottomPaddingPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopPercentageLeftPercentage:
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopPercentageRightPercentage:
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0,@" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomPercentageLeftPercentage:
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomPercentageRightPercentage:
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
           
        case EZLayoutAlignmentTypeTopFixed:
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.rightPaddingPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.topPaddingFixed/containerRect.size.height;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomFixed:
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.rightPaddingPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.bottomPaddingPercentage = self.ezAlignment.bottomPaddingFixed/containerRect.size.height;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeLeftFixed:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.bottomPaddingPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.leftPaddingFixed/containerRect.size.width;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeRightFixed:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.bottomPaddingPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.rightPaddingPercentage = self.ezAlignment.rightPaddingFixed/containerRect.size.width;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopFixedLeftFixed:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.topPaddingFixed/containerRect.size.height;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.leftPaddingFixed/containerRect.size.width;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopFixedRightFixed:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.topPaddingFixed/containerRect.size.height;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = self.ezAlignment.rightPaddingFixed/containerRect.size.width;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomFixedLeftFixed:
            self.ezAlignment.bottomPaddingPercentage = self.ezAlignment.bottomPaddingFixed/containerRect.size.height;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.leftPaddingFixed/containerRect.size.width;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomFixedRightFixed:
            self.ezAlignment.bottomPaddingPercentage = self.ezAlignment.bottomPaddingFixed/containerRect.size.height;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = self.ezAlignment.rightPaddingFixed/containerRect.size.width;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopFixedLeftPercentage:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.topPaddingFixed/containerRect.size.height;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopPercentageLeftFixed:
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.leftPaddingFixed/containerRect.size.width;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeTopFixedRightPercentage:
            self.ezAlignment.topPaddingPercentage = self.ezAlignment.topPaddingFixed/containerRect.size.height;
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");

            break;
        case EZLayoutAlignmentTypeTopPercentageRightFixed:
            self.ezAlignment.bottomPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topPaddingPercentage);
            //NSAssert(self.ezAlignment.bottomPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of top padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = self.ezAlignment.rightPaddingFixed/containerRect.size.width;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");

            break;
        case EZLayoutAlignmentTypeBottomFixedLeftPercentage:
            self.ezAlignment.bottomPaddingPercentage = self.ezAlignment.bottomPaddingFixed/containerRect.size.height;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomPercentageLeftFixed:
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = self.ezAlignment.leftPaddingFixed/containerRect.size.width;
            self.ezAlignment.rightPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftPaddingPercentage);
            //NSAssert(self.ezAlignment.rightPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of left padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomFixedRightPercentage:
            self.ezAlignment.bottomPaddingPercentage = self.ezAlignment.bottomPaddingFixed/containerRect.size.height;
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        case EZLayoutAlignmentTypeBottomPercentageRightFixed:
            self.ezAlignment.topPaddingPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomPaddingPercentage);
            //NSAssert(self.ezAlignment.topPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of bottom padding and height percentage must be less than 1.0");
            self.ezAlignment.rightPaddingPercentage = self.ezAlignment.rightPaddingFixed/containerRect.size.width;
            self.ezAlignment.leftPaddingPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightPaddingPercentage);
            //NSAssert(self.ezAlignment.leftPaddingPercentage>=0.0, @" EZLayout Fatal Error: Sum of right padding and width percentage must be less than 1.0");
            break;
        default:
            //NSAssert(NO, @"EZLayout Fatal Error: Illegal alignment type.");
            break;
    }
    [self valueCheck];
}

- (void) calculateViewInContainerRect:(CGRect) containerRect {
    if (!self.superview) {
        NSAssert(NO, @"EZLayout Fatal Error: Your view should ahve a superview.");
        return;
    }
    if (CGRectEqualToRect(CGRectZero, containerRect)) {
        return;
    }
    [self valueCheck];
    CGFloat vertical = containerRect.size.height;
    CGFloat horizontal = containerRect.size.width;
    CGRect frame = CGRectMake(horizontal*self.ezAlignment.leftPaddingPercentage + containerRect.origin.x,
                            vertical*self.ezAlignment.topPaddingPercentage + containerRect.origin.y,
                            horizontal*self.ezSize.widthPercentage,
                            vertical*self.ezSize.heightPercentage);
    self.frame = frame;
}

- (void) valueCheck {
    BOOL verticalGood = self.ezAlignment.topPaddingPercentage+self.ezAlignment.bottomPaddingPercentage+self.ezSize.heightPercentage==1.0;
    BOOL horizontalGood = self.ezAlignment.leftPaddingPercentage+self.ezAlignment.rightPaddingPercentage+self.ezSize.widthPercentage==1.0;
    //NSAssert(horizontalGood&&verticalGood, @"EZLayout Fatal Error: Alignment and Size percentages must add to 1.0");
}

@end
