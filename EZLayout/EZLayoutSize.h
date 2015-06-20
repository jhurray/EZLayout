//
//  EZLayoutSize.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface EZLayoutSize : NSObject

/***
 
 EZLayoutSizeTypeHeightAndWidth: heightPercentage and widthPercentage set: scale factor plays no role.
 
 EZLayoutSizeTypeHeightAndScale: heightPercentage and scaleFactor set: widthPercentage = MIN(1.0, heightPercentage*scaleFactor)
 
 EZLayoutSizeTypeWidthAndScale: widthPercentage and scaleFactor set: heightPercentage = MIN(1.0, widthPercentage*scaleFactor)
 
 EZLayoutSizeTypeFixed: fixed height and width in frame pixels. Does not need to be between 1.0 and 0.0
 
***/

// Dynamic
+ (instancetype) heightPercentage:(CGFloat)heightPercentage widthPercentage:(CGFloat)widthPercentage;
+ (instancetype) heightPercentage:(CGFloat)heightPercentage scaleFactor:(CGFloat)scaleFactor;
+ (instancetype) widthPercentage:(CGFloat)widthPercentage scaleFactor:(CGFloat)scaleFactor;
// Fixed
+ (instancetype) fixedHeight:(CGFloat)fixedHeight fixedWidth:(CGFloat)fixedWidth;
// Fixed + Dynamic
+ (instancetype) fixedHeight:(CGFloat)fixedHeight widthPercentage:(CGFloat)widthPercentage;
+ (instancetype) fixedWidth:(CGFloat)fixedWidth heightPercentage:(CGFloat)heightPercentage;

// Dynamic
@property (nonatomic) CGFloat heightPercentage;
@property (nonatomic) CGFloat widthPercentage;
@property (nonatomic) CGFloat scaleFactor;
// Fixed
@property (nonatomic) CGFloat fixedWidth;
@property (nonatomic) CGFloat fixedHeight;

- (BOOL) heightSet;
- (BOOL) widthSet;
- (BOOL) scaleSet;

@end
