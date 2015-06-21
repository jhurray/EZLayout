//
//  EZLayoutAlignment.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface EZLayoutAlignment : NSObject

/***

 All percentage margin should be in percentages (1.0 >= margin >= 0.0).
 
***/

#pragma mark - Absolute

+ (instancetype) center; // default val
+ (instancetype) top;
+ (instancetype) bottom;
+ (instancetype) left;
+ (instancetype) right;
+ (instancetype) topLeft;
+ (instancetype) topRight;
+ (instancetype) bottomLeft;
+ (instancetype) bottomRight;

#pragma mark - Percentage

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage;
+ (instancetype) leftPercentage:(CGFloat)leftMarginPercentage;
+ (instancetype) rightPercentage:(CGFloat)rightMarginPercentage;
+ (instancetype) topPercentage:(CGFloat)topMarginPercentage leftPercentage:(CGFloat)leftMarginPercentage;
+ (instancetype) topPercentage:(CGFloat)topMarginPercentage rightPercentage:(CGFloat)rightMarginPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage leftPercentage:(CGFloat)leftMarginPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage rightPercentage:(CGFloat)rightMarginPercentage;

@property (nonatomic) CGFloat topMarginPercentage;
@property (nonatomic) CGFloat bottomMarginPercentage;
@property (nonatomic) CGFloat leftMarginPercentage;
@property (nonatomic) CGFloat rightMarginPercentage;

#pragma mark - Fixed

+ (instancetype) topFixed:(CGFloat)topMarginFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed;
+ (instancetype) leftFixed:(CGFloat)leftMarginFixed;
+ (instancetype) rightFixed:(CGFloat)rightMarginFixed;
+ (instancetype) topFixed:(CGFloat)topMarginFixed leftFixed:(CGFloat)leftMarginFixed;
+ (instancetype) topFixed:(CGFloat)topMarginFixed rightFixed:(CGFloat)rightMarginFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed leftFixed:(CGFloat)leftMarginFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed rightFixed:(CGFloat)rightMarginFixed;

@property (nonatomic) CGFloat topMarginFixed;
@property (nonatomic) CGFloat bottomMarginFixed;
@property (nonatomic) CGFloat leftMarginFixed;
@property (nonatomic) CGFloat rightMarginFixed;

#pragma mark - Percentage + Fixed

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage leftFixed:(CGFloat)leftMarginFixed;
+ (instancetype) topFixed:(CGFloat)topMarginFixed leftPercentage:(CGFloat)leftMarginPercentage;

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage rightFixed:(CGFloat)rightMarginFixed;
+ (instancetype) topFixed:(CGFloat)topMarginFixed rightPercentage:(CGFloat)rightMarginPercentage;

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage leftFixed:(CGFloat)leftMarginFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed leftPercentage:(CGFloat)leftMarginPercentage;

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage rightFixed:(CGFloat)rightMarginFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed rightPercentage:(CGFloat)rightMarginPercentage;


@end
