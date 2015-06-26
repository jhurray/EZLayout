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
    [self valueCheck: containerRect];
    
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
        NSAssert(NO, @"EZLayout Fatal Error: Illegal EZLayoutSizeType");
    }
    
    // Calculate Alignment
    switch (self.ezAlignment.type) {
        
        case EZLayoutAlignmentTypeCenter:
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.rightMarginPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topMarginPercentage = self.ezAlignment.bottomMarginPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            break;
        case EZLayoutAlignmentTypeTopPercentage:
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.rightMarginPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
             break;
        case EZLayoutAlignmentTypeBottomPercentage:
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.rightMarginPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            break;
        case EZLayoutAlignmentTypeLeftPercentage:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.bottomMarginPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeRightPercentage:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.bottomMarginPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopPercentageLeftPercentage:
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopPercentageRightPercentage:
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomPercentageLeftPercentage:
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomPercentageRightPercentage:
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
           
        case EZLayoutAlignmentTypeTopFixed:
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.rightMarginPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.topMarginPercentage = self.ezAlignment.topMarginFixed/containerRect.size.height;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomFixed:
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.rightMarginPercentage = (1.0-self.ezSize.widthPercentage)/2.0;
            self.ezAlignment.bottomMarginPercentage = self.ezAlignment.bottomMarginFixed/containerRect.size.height;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            break;
        case EZLayoutAlignmentTypeLeftFixed:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.bottomMarginPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.leftMarginFixed/containerRect.size.width;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeRightFixed:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.bottomMarginPercentage = (1.0-self.ezSize.heightPercentage)/2.0;
            self.ezAlignment.rightMarginPercentage = self.ezAlignment.rightMarginFixed/containerRect.size.width;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopFixedLeftFixed:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.topMarginFixed/containerRect.size.height;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.leftMarginFixed/containerRect.size.width;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopFixedRightFixed:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.topMarginFixed/containerRect.size.height;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.rightMarginPercentage = self.ezAlignment.rightMarginFixed/containerRect.size.width;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomFixedLeftFixed:
            self.ezAlignment.bottomMarginPercentage = self.ezAlignment.bottomMarginFixed/containerRect.size.height;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.leftMarginFixed/containerRect.size.width;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomFixedRightFixed:
            self.ezAlignment.bottomMarginPercentage = self.ezAlignment.bottomMarginFixed/containerRect.size.height;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.rightMarginPercentage = self.ezAlignment.rightMarginFixed/containerRect.size.width;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopFixedLeftPercentage:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.topMarginFixed/containerRect.size.height;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopPercentageLeftFixed:
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.leftMarginFixed/containerRect.size.width;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopFixedRightPercentage:
            self.ezAlignment.topMarginPercentage = self.ezAlignment.topMarginFixed/containerRect.size.height;
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeTopPercentageRightFixed:
            self.ezAlignment.bottomMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.topMarginPercentage);
            self.ezAlignment.rightMarginPercentage = self.ezAlignment.rightMarginFixed/containerRect.size.width;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomFixedLeftPercentage:
            self.ezAlignment.bottomMarginPercentage = self.ezAlignment.bottomMarginFixed/containerRect.size.height;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomPercentageLeftFixed:
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.leftMarginPercentage = self.ezAlignment.leftMarginFixed/containerRect.size.width;
            self.ezAlignment.rightMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.leftMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomFixedRightPercentage:
            self.ezAlignment.bottomMarginPercentage = self.ezAlignment.bottomMarginFixed/containerRect.size.height;
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        case EZLayoutAlignmentTypeBottomPercentageRightFixed:
            self.ezAlignment.topMarginPercentage = 1.0-(self.ezSize.heightPercentage+self.ezAlignment.bottomMarginPercentage);
            self.ezAlignment.rightMarginPercentage = self.ezAlignment.rightMarginFixed/containerRect.size.width;
            self.ezAlignment.leftMarginPercentage = 1.0-(self.ezSize.widthPercentage+self.ezAlignment.rightMarginPercentage);
            break;
        default:
            NSAssert(NO, @"EZLayout Fatal Error: Illegal alignment type.");
            break;
    }
}

- (void) calculateViewInContainerRect:(CGRect) containerRect {
    if (!self.superview) {
        NSAssert(NO, @"EZLayout Fatal Error: Your view should ahve a superview.");
        return;
    }
    if (CGRectEqualToRect(CGRectZero, containerRect)) {
        return;
    }
    [self valueCheck:containerRect];
    CGFloat vertical = containerRect.size.height;
    CGFloat horizontal = containerRect.size.width;
    CGRect frame = CGRectMake(horizontal*self.ezAlignment.leftMarginPercentage + containerRect.origin.x,
                            vertical*self.ezAlignment.topMarginPercentage + containerRect.origin.y,
                            horizontal*self.ezSize.widthPercentage,
                            vertical*self.ezSize.heightPercentage);
    [self valueCheck:frame];
    self.frame = frame;
}

- (void) valueCheck:(CGRect)rect {
    BOOL rectIsBad = isnan(rect.origin.x) || isnan(rect.origin.y) || isnan(rect.size.width) || isnan(rect.size.height);
    if (rectIsBad) {
        NSLog(@"%@ is not a legal frame.", NSStringFromCGRect(rect));
    }
    NSAssert(!rectIsBad, @"EZLayout Fatal Error: This view's (%@) frame contains a NAN value. Please review your EZLayout code.", NSStringFromClass(self.class));
}

@end
