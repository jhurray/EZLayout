//
//  EZLayoutFlexibleRatio.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/16/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ezFlexRatio(f) [EZLayoutFlexibleRatio withRatio:f]

#define ezFlexRatioDefault ezFlexRatio(1.0)

#define ezFlexDefault ezFlexRatio(1.0)

#define ezFlex ezFlexRatio(1.0)

@interface EZLayoutFlexibleRatio : NSObject

+ (instancetype) withRatio:(CGFloat)ratio;

@property (nonatomic) CGFloat ratio;

@end
