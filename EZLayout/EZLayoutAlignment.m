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
        self.topPaddingPercentage = NAN;
        self.bottomPaddingPercentage = NAN;
        self.leftPaddingPercentage = NAN;
        self.rightPaddingPercentage = NAN;
        self.topPaddingFixed = NAN;
        self.bottomPaddingFixed = NAN;
        self.leftPaddingFixed = NAN;
        self.rightPaddingFixed = NAN;
        self.type = EZLayoutAlignmentTypeCenter;
    }
    return self;
}

+ (instancetype) center {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    return alignment;
}

#pragma mark - Percentage

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage {
    [self paddingPercentageValueCheck:topPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingPercentage = topPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage {
    [self paddingPercentageValueCheck:bottomPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingPercentage = bottomPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentage;
    return alignment;
}

+ (instancetype) leftPercentage:(CGFloat)leftPaddingPercentage {
    [self paddingPercentageValueCheck:leftPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.leftPaddingPercentage = leftPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeLeftPercentage;
    return alignment;
}

+ (instancetype) rightPercentage:(CGFloat)rightPaddingPercentage {
    [self paddingPercentageValueCheck:rightPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.rightPaddingPercentage = rightPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeRightPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage leftPercentage:(CGFloat)leftPaddingPercentage {
    [self paddingPercentageValueCheck:topPaddingPercentage];
    [self paddingPercentageValueCheck:leftPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingPercentage = topPaddingPercentage;
    alignment.leftPaddingPercentage = leftPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentageLeftPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage rightPercentage:(CGFloat)rightPaddingPercentage {
    [self paddingPercentageValueCheck:topPaddingPercentage];
    [self paddingPercentageValueCheck:rightPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingPercentage = topPaddingPercentage;
    alignment.rightPaddingPercentage = rightPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeTopPercentageRightPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage leftPercentage:(CGFloat)leftPaddingPercentage {
    [self paddingPercentageValueCheck:bottomPaddingPercentage];
    [self paddingPercentageValueCheck:leftPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingPercentage = bottomPaddingPercentage;
    alignment.leftPaddingPercentage = leftPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageLeftPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage rightPercentage:(CGFloat)rightPaddingPercentage {
    [self paddingPercentageValueCheck:bottomPaddingPercentage];
    [self paddingPercentageValueCheck:rightPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingPercentage = bottomPaddingPercentage;
    alignment.rightPaddingPercentage = rightPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageRightPercentage;
    return alignment;
}


#pragma mark - Fixed

+ (instancetype) topFixed:(CGFloat)topPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingFixed = topPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingFixed = bottomPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixed;
    return alignment;
}

+ (instancetype) leftFixed:(CGFloat)leftPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.leftPaddingFixed = leftPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeLeftFixed;
    return alignment;
}

+ (instancetype) rightFixed:(CGFloat)rightPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.rightPaddingFixed = rightPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeRightFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topPaddingFixed leftFixed:(CGFloat)leftPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingFixed = topPaddingFixed;
    alignment.leftPaddingFixed = leftPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixedLeftFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topPaddingFixed rightFixed:(CGFloat)rightPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingFixed = topPaddingFixed;
    alignment.rightPaddingFixed = rightPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeTopFixedRightFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed leftFixed:(CGFloat)leftPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingFixed = bottomPaddingFixed;
    alignment.leftPaddingFixed = leftPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixedLeftFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed rightFixed:(CGFloat)rightPaddingFixed {
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingFixed = bottomPaddingFixed;
    alignment.rightPaddingFixed = rightPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeBottomFixedRightFixed;
    return alignment;
}


#pragma mark - Percentage + Fixed

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage leftFixed:(CGFloat)leftPaddingFixed {
    [self paddingPercentageValueCheck:topPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingPercentage = topPaddingPercentage;
    alignment.leftPaddingFixed = leftPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeTopPercentageLeftFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topPaddingFixed leftPercentage:(CGFloat)leftPaddingPercentage {
    [self paddingPercentageValueCheck:leftPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingFixed = topPaddingFixed;
    alignment.leftPaddingPercentage = leftPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeTopFixedLeftPercentage;
    return alignment;
}

+ (instancetype) topPercentage:(CGFloat)topPaddingPercentage rightFixed:(CGFloat)rightPaddingFixed {
    [self paddingPercentageValueCheck:topPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingPercentage = topPaddingPercentage;
    alignment.rightPaddingFixed = rightPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeTopPercentageRightFixed;
    return alignment;
}

+ (instancetype) topFixed:(CGFloat)topPaddingFixed rightPercentage:(CGFloat)rightPaddingPercentage {
    [self paddingPercentageValueCheck:rightPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.topPaddingFixed = topPaddingFixed;
    alignment.rightPaddingPercentage = rightPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeTopFixedRightPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage leftFixed:(CGFloat)leftPaddingFixed {
    [self paddingPercentageValueCheck:bottomPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingPercentage = bottomPaddingPercentage;
    alignment.leftPaddingFixed = leftPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageLeftFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed leftPercentage:(CGFloat)leftPaddingPercentage {
    [self paddingPercentageValueCheck:leftPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingFixed = bottomPaddingFixed;
    alignment.leftPaddingPercentage = leftPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomFixedLeftPercentage;
    return alignment;
}

+ (instancetype) bottomPercentage:(CGFloat)bottomPaddingPercentage rightFixed:(CGFloat)rightPaddingFixed {
    [self paddingPercentageValueCheck:bottomPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingPercentage = bottomPaddingPercentage;
    alignment.rightPaddingFixed = rightPaddingFixed;
    alignment.type = EZLayoutAlignmentTypeBottomPercentageRightFixed;
    return alignment;
}

+ (instancetype) bottomFixed:(CGFloat)bottomPaddingFixed rightPercentage:(CGFloat)rightPaddingPercentage {
    [self paddingPercentageValueCheck:rightPaddingPercentage];
    EZLayoutAlignment *alignment = [[EZLayoutAlignment alloc] init];
    alignment.bottomPaddingFixed = bottomPaddingFixed;
    alignment.rightPaddingPercentage = rightPaddingPercentage;
    alignment.type = EZLayoutAlignmentTypeBottomFixedRightPercentage;
    return alignment;
}

+ (void) paddingPercentageValueCheck:(CGFloat) paddingPercentage {
    BOOL isGucci = (paddingPercentage >= 0.0) && (paddingPercentage <= 1.0);
    //NSAssert(isGucci, @"EZLayout Fatal Error: EZLayoutAlignment padding percentages need to be between 0.0 and 1.0");
}

- (NSString *) description {
    return [NSString stringWithFormat:@"EZLayoutAlignment:\nPercentages:\n topPercent: %f, bottomPercent: %f, leftPercent: %f, rightPercent: %f\n\nFixed:\n topFixed: %f, bottomFixed: %f, leftFixed: %f, rightFixed: %f\n", self.topPaddingPercentage, self.bottomPaddingPercentage, self.leftPaddingPercentage, self.rightPaddingPercentage, self.topPaddingFixed, self.bottomPaddingFixed, self.leftPaddingFixed, self.rightPaddingFixed];
}

@end
