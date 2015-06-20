//
//  EZLayoutSize+Private.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/17/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutSize.h"

typedef NS_ENUM(NSUInteger, EZLayoutSizeType) {
    EZLayoutSizeTypeHeightAndWidth,
    EZLayoutSizeTypeHeightAndScale,
    EZLayoutSizeTypeWidthAndScale,
    EZLayoutSizeTypeFixedHeight,
    EZLayoutSizeTypeFixedWidth,
    EZLayoutSizeTypeFixedHeightAndWidth
};

@interface EZLayoutSize (Private)

@property (nonatomic, readonly) EZLayoutSizeType type;

@end
