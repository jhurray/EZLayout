//
//  EZLayoutContainerView+Private.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/8/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutContainerView.h"

typedef NS_ENUM(NSUInteger, EZLayoutContainerViewType) {
    EZLayoutContainerViewTypeHorizontal,
    EZLayoutContainerViewTypeVertical
};

@interface EZLayoutContainerView (Private)

@property (nonatomic, readonly) EZLayoutContainerViewType type;
@property (nonatomic) BOOL isTopContainer;

@end
