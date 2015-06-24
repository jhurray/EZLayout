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
        self.fixedHeight = NAN;
        self.fixedWidth = NAN;
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

+ (instancetype)  heightFixed:(CGFloat) heightFixed  widthFixed:(CGFloat) widthFixed {
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedHeightAndWidth;
    size.fixedHeight = heightFixed;
    size.fixedWidth = widthFixed;
    return size;
}

+ (instancetype)  heightFixed:(CGFloat) heightFixed widthPercentage:(CGFloat)widthPercentage {
    [self sizePercentageValueCheck:widthPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedHeight;
    size.fixedHeight = heightFixed;
    size.widthPercentage = widthPercentage;
    return size;
}

+ (instancetype)  widthFixed:(CGFloat)widthFixed heightPercentage:(CGFloat)heightPercentage {
    [self sizePercentageValueCheck:heightPercentage];
    EZLayoutSize *size = [[EZLayoutSize alloc] init];
    size.type = EZLayoutSizeTypeFixedWidth;
    size.fixedWidth = widthFixed;
    size.heightPercentage = heightPercentage;
    return size;
}

+ (void) sizePercentageValueCheck:(CGFloat) sizePercentage {
    NSAssert(sizePercentage >= 0.0, @"EZLayout Fatal Error: EZLayoutSize percentages need to be greater than 0.0");
}

- (NSString *) description {
    return [NSString stringWithFormat:@"EZLayoutSize: \nwidthPercentage: %f, heightPercentage: %f, \nscaleFactor: %f, \nfixedWidth: %f, fixedHeight: %f", self.widthPercentage, self.heightPercentage, self.scaleFactor, self.fixedWidth, self.fixedHeight];
}

@end
