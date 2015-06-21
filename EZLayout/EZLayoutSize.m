//
//  EZLayoutSize.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutSize.h"
#import "EZLayoutSize+Private.h"

@interface EZLayoutSize()

@property (nonatomic) EZLayoutSizeType type;

@end

@implementation EZLayoutSize

- (instancetype) init {
    if (self = [super init]) {
        self.heightPercentage = NAN;
        self.widthPercentage = NAN;
        self.scaleFactor = NAN;
    }
    return self;
}

+ (instancetype) heightPercentage:(CGFloat)heightPercentage widthPercentage:(CGFloat)widthPercentage {
    [self sizePercentageValueCheck:heightPercentage];
    [self sizePercentageValueCheck:widthPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeHeightAndWidth;
    size.heightPercentage = heightPercentage;
    size.widthPercentage = widthPercentage;
    return size;
}

+ (instancetype) heightPercentage:(CGFloat)heightPercentage scaleFactor:(CGFloat)scaleFactor {
    [self sizePercentageValueCheck:heightPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeHeightAndScale;
    size.heightPercentage = heightPercentage;
    size.scaleFactor = scaleFactor;
    return size;
}

+ (instancetype) widthPercentage:(CGFloat)widthPercentage scaleFactor:(CGFloat)scaleFactor {
    [self sizePercentageValueCheck:widthPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeWidthAndScale;
    size.widthPercentage = widthPercentage;
    size.scaleFactor = scaleFactor;
    return size;
}

+ (instancetype) fixedHeight:(CGFloat)fixedHeight fixedWidth:(CGFloat)fixedWidth {
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedHeightAndWidth;
    size.fixedHeight = fixedHeight;
    size.fixedWidth = fixedWidth;
    return size;
}

+ (instancetype) fixedHeight:(CGFloat)fixedHeight widthPercentage:(CGFloat)widthPercentage {
    [self sizePercentageValueCheck:widthPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedHeight;
    size.fixedHeight = fixedHeight;
    size.widthPercentage = widthPercentage;
    return size;
}

+ (instancetype) fixedWidth:(CGFloat)fixedWidth heightPercentage:(CGFloat)heightPercentage {
    [self sizePercentageValueCheck:heightPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedWidth;
    size.fixedWidth = fixedWidth;
    size.heightPercentage = heightPercentage;
    return size;
}

- (BOOL) heightSet {
    return !isnan(self.heightPercentage);
}

- (BOOL) widthSet {
    return !isnan(self.widthPercentage);
}

- (BOOL) scaleSet {
    return !isnan(self.scaleFactor);
}

+ (void) sizePercentageValueCheck:(CGFloat) sizePercentage {
    NSAssert(sizePercentage >= 0.0, @"EZLayout Fatal Error: EZLayoutSize percentages need to be greater than 0.0");
}

- (NSString *) description {
    return [NSString stringWithFormat:@"EZLayoutSize: \nwidthPercentage: %f, heightPercentage: %f, \nscaleFactor: %f, \nfixedWidth: %f, fixedHeight: %f", self.widthPercentage, self.heightPercentage, self.scaleFactor, self.fixedWidth, self.fixedHeight];
}

@end
