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

 All percentage padding should be in percentages (1.0 >= padding >= 0.0).
 
***/

#pragma mark - Default

+ (instancetype) center;

#pragma mark - Percentage

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage;
+ (instancetype) leftPercentage:(CGFloat)leftPaddingPercentage;
+ (instancetype) rightPercentage:(CGFloat)rightPaddingPercentage;
+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage leftPercentage:(CGFloat)leftPaddingPercentage;
+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage rightPercentage:(CGFloat)rightPaddingPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage leftPercentage:(CGFloat)leftPaddingPercentage;
+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage rightPercentage:(CGFloat)rightPaddingPercentage;

@property (nonatomic) CGFloat topPaddingPercentage;
@property (nonatomic) CGFloat bottomPaddingPercentage;
@property (nonatomic) CGFloat leftPaddingPercentage;
@property (nonatomic) CGFloat rightPaddingPercentage;

#pragma mark - Fixed

+ (instancetype) topFixed:(CGFloat)topPaddingFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed;
+ (instancetype) leftFixed:(CGFloat)leftPaddingFixed;
+ (instancetype) rightFixed:(CGFloat)rightPaddingFixed;
+ (instancetype) topFixed:(CGFloat)topPaddingFixed leftFixed:(CGFloat)leftPaddingFixed;
+ (instancetype) topFixed:(CGFloat)topPaddingFixed rightFixed:(CGFloat)rightPaddingFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed leftFixed:(CGFloat)leftPaddingFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed rightFixed:(CGFloat)rightPaddingFixed;

@property (nonatomic) CGFloat topPaddingFixed;
@property (nonatomic) CGFloat bottomPaddingFixed;
@property (nonatomic) CGFloat leftPaddingFixed;
@property (nonatomic) CGFloat rightPaddingFixed;

#pragma mark - Percentage + Fixed

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage leftFixed:(CGFloat)leftPaddingFixed;
+ (instancetype) topFixed:(CGFloat)topPaddingFixed leftPercentage:(CGFloat)leftPaddingPercentage;

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage rightFixed:(CGFloat)rightPaddingFixed;
+ (instancetype) topFixed:(CGFloat)topPaddingFixed rightPercentage:(CGFloat)rightPaddingPercentage;

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage leftFixed:(CGFloat)leftPaddingFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed leftPercentage:(CGFloat)leftPaddingPercentage;

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage rightFixed:(CGFloat)rightPaddingFixed;
+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed rightPercentage:(CGFloat)rightPaddingPercentage;


@end
