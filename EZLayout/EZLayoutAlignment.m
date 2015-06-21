//
//  EZLayoutAlignment.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutAlignment.h"
#import "EZLayoutAlignment+Private.h"

@interface EZLayoutAlignment()

@property (nonatomic) EZLayoutAlignmentType type;

@end

@implementation EZLayoutAlignment

-(instancetype) init {
    if (self = [super init]) {
        self.topMarginPercentage = NAN;
        self.bottomMarginPercentage = NAN;
        self.leftMarginPercentage = NAN;
        self.rightMarginPercentage = NAN;
        self.topMarginFixed = NAN;
        self.bottomMarginFixed = NAN;
        self.leftMarginFixed = NAN;
        self.rightMarginFixed = NAN;
        self.type = EZLayoutAlignmentTypeCenter;
    }
    return self;
}

#pragma mark - Absolute

+ (instancetype) center {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    return alignment;
}

+ (instancetype) top {
    return [self topPercentage:0.0];
}

+ (instancetype) bottom {
    return [self bottomPercentage:0.0];
}

+ (instancetype) left {
    return [self leftPercentage:0.0];
}

+ (instancetype) right {
    return [self rightPercentage:0.0];
}

+ (instancetype) topLeft {
    return [self topPercentage:0.0 leftPercentage:0.0];
}

+ (instancetype) topRight {
    return [self topPercentage:0.0 rightPercentage:0.0];
}

+ (instancetype) bottomLeft {
    return [self bottomPercentage:0.0 leftPercentage:0.0];
}

+ (instancetype) bottomRight {
    return [self bottomPercentage:0.0 rightPercentage:0.0];
}

#pragma mark - Percentage

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginPercentage = topMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginPercentage = bottomMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentage;
    return alignment;
}

+ (instancetype) leftPercentage:(CGFloat)leftMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.leftMarginPercentage = leftMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeLeftPercentage;
    return alignment;
}

+ (instancetype) rightPercentage:(CGFloat)rightMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.rightMarginPercentage = rightMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeRightPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage leftPercentage:(CGFloat)leftMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginPercentage = topMarginPercentage;
    alignment.leftMarginPercentage = leftMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentageLeftPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage rightPercentage:(CGFloat)rightMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginPercentage = topMarginPercentage;
    alignment.rightMarginPercentage = rightMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentageRightPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage leftPercentage:(CGFloat)leftMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginPercentage = bottomMarginPercentage;
    alignment.leftMarginPercentage = leftMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageLeftPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage rightPercentage:(CGFloat)rightMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginPercentage = bottomMarginPercentage;
    alignment.rightMarginPercentage = rightMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageRightPercentage;
    return alignment;
}


#pragma mark - Fixed

+ (instancetype) topFixed:(CGFloat)topMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginFixed = topMarginFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginFixed = bottomMarginFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixed;
    return alignment;
}

+ (instancetype) leftFixed:(CGFloat)leftMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.leftMarginFixed = leftMarginFixed;
    alignment.type = EZLayoutAlignmentTypeLeftFixed;
    return alignment;
}

+ (instancetype) rightFixed:(CGFloat)rightMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.rightMarginFixed = rightMarginFixed;
    alignment.type = EZLayoutAlignmentTypeRightFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topMarginFixed leftFixed:(CGFloat)leftMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginFixed = topMarginFixed;
    alignment.leftMarginFixed = leftMarginFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixedLeftFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topMarginFixed rightFixed:(CGFloat)rightMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginFixed = topMarginFixed;
    alignment.rightMarginFixed = rightMarginFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixedRightFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed leftFixed:(CGFloat)leftMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginFixed = bottomMarginFixed;
    alignment.leftMarginFixed = leftMarginFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixedLeftFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed rightFixed:(CGFloat)rightMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginFixed = bottomMarginFixed;
    alignment.rightMarginFixed = rightMarginFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixedRightFixed;
    return alignment;
}


#pragma mark - Percentage + Fixed

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage leftFixed:(CGFloat)leftMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginPercentage = topMarginPercentage;
    alignment.leftMarginFixed = leftMarginFixed;
    alignment.type = EZLayoutAlignmentTypeTopPercentageLeftFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topMarginFixed leftPercentage:(CGFloat)leftMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginFixed = topMarginFixed;
    alignment.leftMarginPercentage = leftMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeTopFixedLeftPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topMarginPercentage rightFixed:(CGFloat)rightMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginPercentage = topMarginPercentage;
    alignment.rightMarginFixed = rightMarginFixed;
    alignment.type = EZLayoutAlignmentTypeTopPercentageRightFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topMarginFixed rightPercentage:(CGFloat)rightMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topMarginFixed = topMarginFixed;
    alignment.rightMarginPercentage = rightMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeTopFixedRightPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage leftFixed:(CGFloat)leftMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginPercentage = bottomMarginPercentage;
    alignment.leftMarginFixed = leftMarginFixed;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageLeftFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed leftPercentage:(CGFloat)leftMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginFixed = bottomMarginFixed;
    alignment.leftMarginPercentage = leftMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomFixedLeftPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomMarginPercentage rightFixed:(CGFloat)rightMarginFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginPercentage = bottomMarginPercentage;
    alignment.rightMarginFixed = rightMarginFixed;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageRightFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomMarginFixed rightPercentage:(CGFloat)rightMarginPercentage {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomMarginFixed = bottomMarginFixed;
    alignment.rightMarginPercentage = rightMarginPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomFixedRightPercentage;
    return alignment;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"EZLayoutAlignment:\nPercentages:\n topPercent: %f, bottomPercent: %f, leftPercent: %f, rightPercent: %f\n\nFixed:\n topFixed: %f, bottomFixed: %f, leftFixed: %f, rightFixed: %f\n", self.topMarginPercentage, self.bottomMarginPercentage, self.leftMarginPercentage, self.rightMarginPercentage, self.topMarginFixed, self.bottomMarginFixed, self.leftMarginFixed, self.rightMarginFixed];
}

@end
