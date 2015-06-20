//
//  UIView+EZLayout.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+EZLayout.h"
#import "EZLayoutContainerView+Private.h"

@implementation UIView (EZLayout)

#pragma mark - EZLayout Initializers

+ (instancetype) ezMakeBasic {
    return [[self alloc] init];
}

+ (instancetype) ezMake:(void (^)(UIView *))makeBlock {
    __block UIView *view = [self ezMakeBasic];
    makeBlock(view);
    return view;
}

+ (NSArray *) ezMakeViews:(NSUInteger)numViews make:(void(^)(UIView *make, NSUInteger index))makeBlock {
    NSMutableArray *array = [@[] mutableCopy];
    for (NSUInteger idx = 0; idx < numViews; ++idx) {
        __block UIView *view = [self ezMakeBasic];
        makeBlock(view, idx);
        [array addObject:view];
    }
    return [NSArray arrayWithArray:array];
}

#pragma mark - EZLayout Classes

- (EZMakeBlock) frameWasSetBlock {
    EZMakeBlock makeBlock = objc_getAssociatedObject(self, @selector(frameWasSetBlock));
    return makeBlock;
}

- (void) setFrameWasSetBlock:(EZMakeBlock)frameWasSetBlock {
    objc_setAssociatedObject(self, @selector(frameWasSetBlock), frameWasSetBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (EZLayoutAlignment *) ezAlignment {
    EZLayoutAlignment *alignment = objc_getAssociatedObject(self, @selector(ezAlignment));
    if (!alignment) {
        alignment = [EZLayoutAlignment center];
        [self setEzAlignment:alignment];
    }
    return alignment;
}

- (void) setEzAlignment:(EZLayoutAlignment *)ezAlignment {
    objc_setAssociatedObject(self, @selector(ezAlignment), ezAlignment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (EZLayoutSize *) ezSize {
    EZLayoutSize *size = objc_getAssociatedObject(self, @selector(ezSize));
    if (!size) {
        size = [EZLayoutSize heightPercentage:1.0 widthPercentage:1.0];
        [self setEzSize:size];
    }
    return size;
}

- (void) setEzSize:(EZLayoutSize *)ezSize {
    objc_setAssociatedObject(self, @selector(ezSize), ezSize, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - EZLayout Helpers

@dynamic ezX, ezY, ezHeight, ezWidth;

- (CGFloat) ezX {
    return self.frame.origin.x;
}

- (CGFloat) ezY {
    return self.frame.origin.y;
}

- (CGFloat) ezWidth {
    return self.frame.size.width;
}

- (CGFloat) ezHeight {
    return self.frame.size.height;
}

- (void) setEzX:(CGFloat)ezX {
    CGRect frame = self.frame;
    frame.origin.x = ezX;
    self.frame = frame;
}

- (void) setEzY:(CGFloat)ezY {
    CGRect frame = self.frame;
    frame.origin.y = ezY;
    self.frame = frame;
}

- (void) setEzWidth:(CGFloat)ezWidth {
    CGRect frame = self.frame;
    frame.size.width = ezWidth;
    self.frame = frame;
}

- (void) setEzHeight:(CGFloat)ezHeight {
    CGRect frame = self.frame;
    frame.size.height = ezHeight;
    self.frame = frame;
}

#pragma mark - Method Swizzling

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(layoutSubviews);
        SEL swizzledSelector = @selector(ezLayout_layoutSubviews);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void) ezLayout_layoutSubviews {
    [self ezLayout_layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[EZLayoutContainerView class]]) {
            EZLayoutContainerView *containerView = (EZLayoutContainerView *)view;
            if (containerView.isTopContainer) {
                containerView.frame = self.bounds;
                [containerView ezLayoutSubviews];
            }
        }
    }
}


@end
