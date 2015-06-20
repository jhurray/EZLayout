//
//  EZLayoutAlignment+Private.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/16/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutAlignment.h"

typedef NS_ENUM(NSUInteger, EZLayoutAlignmentType) {
    EZLayoutAlignmentTypeCenter, // default
    EZLayoutAlignmentTypeTopPercentage,
    EZLayoutAlignmentTypeTopFixed,
    EZLayoutAlignmentTypeBottomPercentage,
    EZLayoutAlignmentTypeBottomFixed,
    EZLayoutAlignmentTypeLeftPercentage,
    EZLayoutAlignmentTypeLeftFixed,
    EZLayoutAlignmentTypeRightPercentage,
    EZLayoutAlignmentTypeRightFixed,
    EZLayoutAlignmentTypeTopPercentageLeftPercentage,
    EZLayoutAlignmentTypeTopPercentageLeftFixed,
    EZLayoutAlignmentTypeTopFixedLeftPercentage,
    EZLayoutAlignmentTypeTopFixedLeftFixed,
    EZLayoutAlignmentTypeTopPercentageRightPercentage,
    EZLayoutAlignmentTypeTopPercentageRightFixed,
    EZLayoutAlignmentTypeTopFixedRightPercentage,
    EZLayoutAlignmentTypeTopFixedRightFixed,
    EZLayoutAlignmentTypeBottomPercentageLeftPercentage,
    EZLayoutAlignmentTypeBottomPercentageLeftFixed,
    EZLayoutAlignmentTypeBottomFixedLeftPercentage,
    EZLayoutAlignmentTypeBottomFixedLeftFixed,
    EZLayoutAlignmentTypeBottomPercentageRightPercentage,
    EZLayoutAlignmentTypeBottomPercentageRightFixed,
    EZLayoutAlignmentTypeBottomFixedRightPercentage,
    EZLayoutAlignmentTypeBottomFixedRightFixed,
};

@interface EZLayoutAlignment (Private)

@property (nonatomic, readonly) EZLayoutAlignmentType type;

@end
