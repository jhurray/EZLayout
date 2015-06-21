//
//  UIView+EZLayout.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZLayoutAlignment.h"
#import "EZLayoutSize.h"

typedef void (^EZMakeBlock)(UIView *make);
#define ezMakeBlock(make) ^void (UIView *make)

typedef void (^EZFrameWasSetBlock)();
#define ezFrameWasSetBlock() ^void ()

@interface UIView (EZLayout)

#pragma mark - EZLayout Initializers
// Will  be the default view. Centered and fills 100%
+ (instancetype) ezMakeBasic;
+ (instancetype) ezMake:(EZMakeBlock)makeBlock;
+ (NSArray *) ezMakeViews:(NSUInteger)numViews make:(void(^)(UIView *make, NSUInteger index))makeBlock;

#pragma mark - Helper Blocks
@property (nonatomic, copy) EZFrameWasSetBlock frameWasSetBlock;

#pragma mark - EZLayout Classes
@property (strong, nonatomic) EZLayoutSize *ezSize;
@property (strong, nonatomic) EZLayoutAlignment *ezAlignment;

#pragma mark - EZLayout Helpers
@property (nonatomic) CGFloat ezX;
@property (nonatomic) CGFloat ezY;
@property (nonatomic) CGFloat ezHeight;
@property (nonatomic) CGFloat ezWidth;

@end
