//
//  EZLayoutContainerView.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutContainerView.h"
#import "UIView+EZLayout.h"
#import "UIView+EZLayout_Private.h"
#import "UIDevice+EZLayout.h"
#import "EZLayoutConstants.h"
#import "EZLayoutDebugLayer.h"
#import "EZLayoutFlexibleRatio.h"
#import "EZLayoutContainerView+Private.h"

@interface EZLayoutContainerView()

// Initializers for portrait mode
- (instancetype) initWithType:(EZLayoutContainerViewType)type views:(NSArray *)views percentages:(NSArray *)percentages;
- (instancetype) initWithType:(EZLayoutContainerViewType)type views:(NSArray *)views fixedLengths:(NSArray *)fixedLengths;

@property (nonatomic, strong) NSArray *views;
@property (nonatomic, strong) NSArray *percentages;

@property (nonatomic, strong) NSArray *landscapeViews;
@property (nonatomic, strong) NSArray *landscapePercentages;

@property (nonatomic, strong) NSArray *fixedLengths;
@property (nonatomic, strong) NSArray *landscapeFixedLengths;

@property (nonatomic) BOOL percentagesNeedCalculation;
@property (nonatomic) BOOL landscapePercentagesNeedCalculation;
@property (nonatomic) BOOL isTopContainer;
@property (nonatomic) EZLayoutContainerViewType portraitType;
@property (nonatomic) EZLayoutContainerViewType landscapeType;
- (EZLayoutContainerViewType) type;
@property (nonatomic, readonly) NSUInteger numViews;

- (void) setup;
- (void) sanityCheck;
- (NSArray *) rectsForLayout;
- (CGRect) rectForPosition:(NSUInteger)position;
- (void) removeSubviews;
- (void) removeCurrentViews;
- (BOOL) shouldLayoutLandscape;
- (NSArray *) currentViews;
- (NSArray *) currentPercentages;
- (BOOL) number:(CGFloat)num equalTo:(CGFloat)target withinRange:(CGFloat)range;
- (void) orientationChanged:(NSNotification *)notification;

@end

@implementation EZLayoutContainerView

#pragma mark - Setup

- (void) setup {
    self.isTopContainer = NO;
    self.landscapePercentagesNeedCalculation = NO;
    self.percentagesNeedCalculation = NO;
    self.orderSubviewsByTag = YES;
}

#pragma mark - Class Initializers
// Basic init
+ (instancetype) container {
    return [[EZLayoutContainerView alloc] init];
}

// Initializers for portrait mode
+ (instancetype) containerFilledWithView:(UIView *)view {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithViewToFill:view];
    return container;
}

+ (instancetype) containerWithHorizontalViews:(NSArray *)views percentages:(NSArray *)percentages {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithHorizontalViews:views percentages:percentages];
    return container;
}

+ (instancetype) containerWithVerticalViews:(NSArray *)views percentages:(NSArray *)percentages {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithVerticalViews:views percentages:percentages];
    return container;
}

+ (instancetype) containerWithHorizontalViews:(NSArray *)views fixedWidths:(NSArray *)fixedWidths {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithHorizontalViews:views fixedWidths:fixedWidths];
    return container;
}

+ (instancetype) containerWithVerticalViews:(NSArray *)views fixedHeights:(NSArray *)fixedHeights {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithVerticalViews:views fixedHeights:fixedHeights];
    return container;
}

// Initializer for the first container view
// starts EZLayout
// calls attachToViewController:
+ (instancetype) containerWithViewController:(UIViewController *)viewController {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithViewController:viewController];
    return container;
}

// Initializer for the first container view
// starts EZLayout
// calls attachToTableViewCell:
+ (instancetype) containerWithTableViewCell:(UITableViewCell *)cell {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithTableViewCell:cell];
    return container;
}

// Initializer for the first container view
// starts EZLayout
// calls attachToContainerView:
+ (instancetype) containerWithContainerView:(EZLayoutContainerView *)containerView {
    EZLayoutContainerView *container = [[EZLayoutContainerView alloc] initWithContainerView:containerView];
    return container;
}


#pragma mark - Instance Initializers
// Initializers for portrait mode

- (instancetype) initWithViewToFill:(UIView *)view {
    if (self = [super init]) {
        [self setup];
        [self fillWithView:view];
    }
    return self;
}

- (instancetype) initWithHorizontalViews:(NSArray *)views percentages:(NSArray *)percentages {
    return [self initWithType:EZLayoutContainerViewTypeHorizontal views:views percentages:percentages];
}

- (instancetype) initWithVerticalViews:(NSArray *)views percentages:(NSArray *)percentages {
    return [self initWithType:EZLayoutContainerViewTypeHorizontal views:views percentages:percentages];
}

- (instancetype) initWithHorizontalViews:(NSArray *)views fixedWidths:(NSArray *)fixedWidths {
    return [self initWithType:EZLayoutContainerViewTypeHorizontal views:views fixedLengths:fixedWidths];
}

- (instancetype) initWithVerticalViews:(NSArray *)views fixedHeights:(NSArray *)fixedHeights {
    return [self initWithType:EZLayoutContainerViewTypeVertical views:views fixedLengths:fixedHeights];
}

- (instancetype) init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype) initWithType:(EZLayoutContainerViewType)type views:(NSArray *)views percentages:(NSArray *)percentages {
    if (self = [super init]) {
        [self setup];
        self.isTopContainer = NO;
        if (type == EZLayoutContainerViewTypeHorizontal) {
            [self horizontallyLayoutViews:views withPercentages:percentages];
        }
        else if (type == EZLayoutContainerViewTypeVertical) {
            [self verticallyLayoutViews:views withPercentages:percentages];
        }
        else {
            NSAssert(NO, @"EZLayout Fatal Error: Illegal value for EZLayoutContainerViewType.");
        }
    }
    return self;
}

- (instancetype) initWithType:(EZLayoutContainerViewType)type views:(NSArray *)views fixedLengths:(NSArray *)fixedLengths {
    if (self = [super init]) {
        [self setup];
        self.isTopContainer = NO;
        if (type == EZLayoutContainerViewTypeHorizontal) {
            [self horizontallyLayoutViews:views withFixedWidths:fixedLengths];
        }
        else if (type == EZLayoutContainerViewTypeVertical) {
            [self verticallyLayoutViews:views withFixedHeights:fixedLengths];
        }
        else {
            NSAssert(NO, @"EZLayout Fatal Error: Illegal value for EZLayoutContainerViewType.");
        }
    }
    return self;
}

// Initializer for the first container view
// starts EZLayout
- (instancetype) initWithViewController:(UIViewController *)viewController {
    if (self = [super init])  {
        [self setup];
        [self attachToViewController:viewController];
    }
    return self;
}

- (instancetype) initWithTableViewCell:(UITableViewCell *)cell {
    if (self = [super init])  {
        [self setup];
        [self attachToTableViewCell:cell];
    }
    return self;
}

// Initializer for the first container view
// starts EZLayout
// calls attachToContainerView:
- (instancetype) initWithContainerView:(EZLayoutContainerView *)containerView {
    if (self = [super init])  {
        [self setup];
        [self attachToContainerView:containerView];
    }
    return self;
}

// Used to start EZLayout
- (void) attachToViewController:(UIViewController *)viewController {
    for (UIView *view in viewController.view.subviews) {
        if ([view isKindOfClass:[EZLayoutContainerView class]]) {
            NSAssert(NO, @"EZLayout Fatal Error: An EZLayoutContainerView is already attached to this view controller.");
        }
    }
    if([UIViewController instancesRespondToSelector:@selector(edgesForExtendedLayout)]) {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.isTopContainer = YES;
    viewController.extendedLayoutIncludesOpaqueBars = NO;
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    self.frame = viewController.view.bounds;
    [viewController.view addSubview:self];
}

- (void) attachToTableViewCell:(UITableViewCell *)cell {
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[EZLayoutContainerView class]]) {
            NSAssert(NO, @"EZLayout Fatal Error: An EZLayoutContainerView is already attached to this table view cell.");
        }
    }
    self.isTopContainer = YES;
    self.frame = cell.contentView.bounds;
    [cell.contentView addSubview:self];
}

- (void) attachToContainerView:(EZLayoutContainerView *)containerView {
    [containerView addSubview:self];
    [containerView ezLayoutSubviews];
}

- (void) orientationChanged:(NSNotification *)notification {
    [self.superview layoutSubviews];
    [self ezLayoutSubviewsAnimated];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil && self.isTopContainer) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (void)didMoveToWindow {
    if (self.window && self.isTopContainer) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
    }
}

#pragma mark - Portrait Orientation

/* Fill */
- (void) fillWithView:(UIView *)view {
    [self horizontallyLayoutViews:@[view] withPercentages:@[@1.0]];
}

/* Dynamic */
// lays out views left to right
- (void) horizontallyLayoutViews:(NSArray *)views withPercentages:(NSArray *)percentages {
    self.portraitType = EZLayoutContainerViewTypeHorizontal;
    self.views = views;
    self.percentages = percentages;
    [self sanityCheck];
    [self ezLayoutSubviews];
    
}

// Lays out views top to bottom
- (void) verticallyLayoutViews:(NSArray *)views withPercentages:(NSArray *)percentages {
    self.portraitType = EZLayoutContainerViewTypeVertical;
    self.views = views;
    self.percentages = percentages;
    [self sanityCheck];
    [self ezLayoutSubviews];
}

/* Fixed + Dynamic */
// lays out views left to right
- (void) horizontallyLayoutViews:(NSArray *)views withFixedWidths:(NSArray *)widths {
    self.portraitType = EZLayoutContainerViewTypeHorizontal;
    self.fixedLengths = widths;
    if (self.superview) {
        self.percentagesNeedCalculation = NO;
        NSArray *percentages = [self calculatePercentagesFromLengths:widths containerLength:self.superview.ezWidth];
        [self horizontallyLayoutViews:views withPercentages:percentages];
    } else {
        self.percentagesNeedCalculation = YES;
        self.views = views;
    }
}

// Lays out views top to bottom
- (void) verticallyLayoutViews:(NSArray *)views withFixedHeights:(NSArray *)heights {
    self.portraitType = EZLayoutContainerViewTypeVertical;
    self.fixedLengths = heights;
    if (self.superview) {
        self.percentagesNeedCalculation = NO;
        NSArray *percentages = [self calculatePercentagesFromLengths:heights containerLength:self.superview.ezHeight];
        [self verticallyLayoutViews:views withPercentages:percentages];
    } else {
        self.percentagesNeedCalculation = YES;
        self.views = views;
    }
}

#pragma mark - Landscape Orientation

/* Fill */
- (void) fillWithLandscapeView:(UIView *)view {
    [self horizontallyLayoutLandscapeViews:@[view] withLandscapePercentages:@[@1.0]];
}

/* Dynamic */
// lays out views left to right
- (void) horizontallyLayoutLandscapeViews:(NSArray *)landscapeViews withLandscapePercentages:(NSArray *)landscapePercentages {
    self.landscapeType = EZLayoutContainerViewTypeHorizontal;
    self.landscapeViews = landscapeViews;
    self.landscapePercentages = landscapePercentages;
    [self sanityCheck];
    [self ezLayoutSubviews];
}

// Lays out views top to bottom
- (void) verticallyLayoutLandscapeViews:(NSArray *)landscapeViews withLandscapePercentages:(NSArray *)landscapePercentages {
    self.landscapeType = EZLayoutContainerViewTypeVertical;
    self.landscapeViews = landscapeViews;
    self.landscapePercentages = landscapePercentages;
    [self sanityCheck];
    [self ezLayoutSubviews];
}

/* Fixed + Dynamic */
// lays out views left to right
- (void) horizontallyLayoutLandscapeViews:(NSArray *)landscapeViews withFixedLandscapeWidths:(NSArray *)landscapeWidths {
    self.landscapeType = EZLayoutContainerViewTypeHorizontal;
    self.landscapeFixedLengths = landscapeWidths;
    if (self.superview) {
        self.landscapePercentagesNeedCalculation = NO;
        CGFloat containterLength = [UIDevice isLandscape] ? self.superview.ezWidth : self.superview.ezHeight;
        NSArray *percentages = [self calculatePercentagesFromLengths:landscapeWidths containerLength:containterLength];
        [self horizontallyLayoutLandscapeViews:landscapeViews withLandscapePercentages:percentages];
        
    } else {
        self.landscapePercentagesNeedCalculation = YES;
        self.landscapeViews = landscapeViews;
    }
}

// Lays out views top to bottom
- (void) verticallyLayoutLandscapeViews:(NSArray *)landscapeViews withFixedLandscapeHeights:(NSArray *)landscapeHeights {
    self.landscapeType = EZLayoutContainerViewTypeVertical;
    self.landscapeFixedLengths = landscapeHeights;
    if (self.superview) {
        self.landscapePercentagesNeedCalculation = NO;
        CGFloat containterLength = [UIDevice isLandscape] ? self.superview.ezHeight : self.superview.ezWidth;
        NSArray *percentages = [self calculatePercentagesFromLengths:landscapeHeights containerLength:containterLength];
        [self verticallyLayoutLandscapeViews:landscapeViews withLandscapePercentages:percentages];
        
    } else {
        self.landscapePercentagesNeedCalculation = YES;
        self.landscapeViews = landscapeViews;
    }
}


#pragma mark - Other
- (void) ezLayoutSubviews {
    [self removeCurrentViews];
    if (kEZDebugMode) {
        [EZLayoutDebugLayer removeAllFromView:self];
    }
    if (self.isTopContainer) {
        self.frame = self.superview.bounds;
    }
    
    // All Subviews not layed out Horizontally or Vertically
    // Views in the background
    for (UIView *view in self.subviews) {
        [view calculateSizeAndAlignmentValuesInContainerRect:self.bounds];
        [view calculateViewInContainerRect:self.bounds];
        if (view.frameWasSetBlock) {
            view.frameWasSetBlock(self);
        }
        if ([view isKindOfClass:[EZLayoutContainerView class]]) {
            EZLayoutContainerView *ezView = (EZLayoutContainerView *)view;
            [ezView ezLayoutSubviews];
        }
    }
    
    // Layout vertical or horizontal
    [self checkPercentagesNeedCalculations];
    NSArray *rects = [self rectsForLayout];
    for (NSUInteger idx=0; idx < self.numViews; ++idx) {
        id viewObject = [self.currentViews objectAtIndex:idx];
        if ([viewObject isKindOfClass:[NSNull class]]) {
            continue;
        }
        UIView *viewForLayout = viewObject;
        [self addSubview:viewForLayout];
        NSValue *rectVal = [rects objectAtIndex:idx];
        CGRect rect = [rectVal CGRectValue];
        if (kEZDebugMode) {
            EZLayoutDebugLayer *layer = [EZLayoutDebugLayer debugLayerWithFrame:rect];
            [self.layer insertSublayer:layer atIndex:0];
        }
        [viewForLayout calculateSizeAndAlignmentValuesInContainerRect:rect];
        [viewForLayout calculateViewInContainerRect:rect];
        if (viewForLayout.frameWasSetBlock) {
            viewForLayout.frameWasSetBlock(self);
        }
        if ([viewForLayout isKindOfClass:[EZLayoutContainerView class]]) {
            EZLayoutContainerView *ezViewForLayout = (EZLayoutContainerView *)viewForLayout;
            [ezViewForLayout ezLayoutSubviews];
        }
    }
    if (self.orderSubviewsByTag) {
        [self orderSubviewsArrayByTag];
    }
}

- (void) ezLayoutSubviewsAnimated {
    [UIView animateWithDuration:0.3 animations:^{
        [self ezLayoutSubviews];
    }];
}

#pragma mark - Private

- (void) orderSubviewsArrayByTag {
    NSSortDescriptor *comparisonByTag = [NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES];
    NSArray *subviews = [self.subviews sortedArrayUsingDescriptors:@[comparisonByTag]];
    [self removeSubviews];
    for (UIView *view in subviews) {
        [self addSubview:view];
    }
}

- (void) checkPercentagesNeedCalculations {
    if (self.fixedLengths && self.percentagesNeedCalculation) {
        if (self.type == EZLayoutContainerViewTypeHorizontal) {
            self.percentages = [self calculatePercentagesFromLengths:self.fixedLengths
                                                     containerLength:self.superview.ezWidth];
        } else {
            self.percentages = [self calculatePercentagesFromLengths:self.fixedLengths
                                                     containerLength:self.superview.ezHeight];
        }
    }
    if (self.landscapeFixedLengths && self.landscapePercentagesNeedCalculation) {
        if (self.type == EZLayoutContainerViewTypeHorizontal) {
            self.landscapePercentages = [self calculatePercentagesFromLengths:self.fixedLengths
                                                              containerLength:self.superview.ezWidth];
        } else {
            self.landscapePercentages = [self calculatePercentagesFromLengths:self.fixedLengths
                                                              containerLength:self.superview.ezHeight];
        }
    }
}

- (NSArray *) calculatePercentagesFromLengths:(NSArray *)lengths containerLength:(CGFloat)containerLength{
    NSMutableArray *percentages = [NSMutableArray new];
    CGFloat cumulativeFixedLength = 0.0;
    CGFloat cumulativeRatio = 0.0;
    for (id object in lengths) {
        if ([object isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)object;
            cumulativeFixedLength += number.floatValue;
        }
        else if ([object isKindOfClass:[EZLayoutFlexibleRatio class]]) {
            EZLayoutFlexibleRatio *ratio = (EZLayoutFlexibleRatio *)object;
            cumulativeRatio += ratio.ratio;
        }
        else {
            NSAssert(NO, @"EZLayout Fatal Error: Objects in array 'widths' must be of type NSNumber or EZLayoutFlexibleRatio.");
        }
        
    }
    CGFloat remainingLengthForPercentages = (containerLength - cumulativeFixedLength);
    for (id object in lengths) {
        if ([object isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)object;
            [percentages addObject:@(number.floatValue/containerLength)];
        }
        else if ([object isKindOfClass:[EZLayoutFlexibleRatio class]]) {
            EZLayoutFlexibleRatio *ratio = (EZLayoutFlexibleRatio *)object;
            [percentages addObject:@((ratio.ratio/cumulativeRatio*remainingLengthForPercentages)/containerLength)];
        }
    }
    return [NSArray arrayWithArray:percentages];
}

- (void) sanityCheck {
    BOOL isGucci = self.views.count == self.percentages.count && self.currentViews.count == self.currentPercentages.count;
    NSAssert(isGucci, @"EZLayout Fatal Error: Views and percentages must have the same number of objects.");
    for (id object in self.views) {
        if ([object isKindOfClass:[NSNull class]]) {
            continue;
        }
        if (![object isKindOfClass:[UIView class]]) {
            isGucci = NO;
            NSAssert(isGucci, @"EZLayout Fatal Error: Views must all be of type UIView.");
        }
    }
    CGFloat cumulativePercentage = 0.0;
    for (id object in self.percentages) {
        if (self.percentagesNeedCalculation) {
            break;
        }
        if (![object isKindOfClass:[NSNumber class]]) {
            isGucci = NO;
            NSAssert(isGucci, @"EZLayout Fatal Error: Percentages` must all be of type NSNumber.");
        }
        NSNumber *percentage = object;
        isGucci = (percentage.floatValue>=0.0)&&(percentage.floatValue<=1.0);
        NSAssert(isGucci, @"EZLayout Fatal Error: Percentages must all be between 0.0 and 1.0.");
        cumulativePercentage += percentage.floatValue;
    }
    if (self.percentagesNeedCalculation) {
        cumulativePercentage = 1.0;
    }
    isGucci = [self number:cumulativePercentage equalTo:1.0 withinRange:0.005];
    NSAssert(isGucci, @"EZLayout Fatal Error: Percentages must add up to exactly 1.0 (100%@)", @"%");
    
    // Landscape views
    if (self.shouldLayoutLandscape) {
        for (id object in self.landscapeViews) {
            if ([object isKindOfClass:[NSNull class]]) {
                continue;
            }
            if (![object isKindOfClass:[UIView class]]) {
                isGucci = NO;
                NSAssert(isGucci, @"EZLayout Fatal Error: Landscape views must all be of type UIView.");
            }
        }
        CGFloat cumulativePercentage = 0.0;
        for (id object in self.landscapePercentages) {
            if (self.landscapePercentagesNeedCalculation) {
                break;
            }
            if (![object isKindOfClass:[NSNumber class]]) {
                isGucci = NO;
                NSAssert(isGucci, @"EZLayout Fatal Error: Landscape percentages` must all be of type NSNumber.");
            }
            NSNumber *percentage = object;
            isGucci = (percentage.floatValue>=0.0)&&(percentage.floatValue<=1.0);
            NSAssert(isGucci, @"EZLayout Fatal Error: Percentages must all be between 0.0 and 1.0.");
            cumulativePercentage += percentage.floatValue;
        }
        if (self.landscapePercentagesNeedCalculation) {
            cumulativePercentage = 1.0;
        }
        isGucci = [self number:cumulativePercentage equalTo:1.0 withinRange:0.0005];
        NSAssert(isGucci, @"EZLayout Fatal Error: Percentages must add up to exactly 1.0 (100%@)", @"%");
    }
}

- (NSUInteger) numViews {
    return self.currentViews.count;
}

- (NSArray *) rectsForLayout {
    NSMutableArray *rects = [NSMutableArray new];
    for (NSUInteger idx=0; idx < self.numViews; ++idx) {
        CGRect rect = [self rectForPosition:idx];
        [rects addObject:[NSValue valueWithCGRect:rect]];
    }
    return rects;
}

- (CGRect) rectForPosition:(NSUInteger)position {
    BOOL isHorizontal = self.type == EZLayoutContainerViewTypeHorizontal;
    CGFloat percentage = ((NSNumber *)[self.currentPercentages objectAtIndex:position]).floatValue;
    CGFloat cumulativePercentage = 0.0;
    for (NSUInteger idx=0; idx < position; ++idx) {
        cumulativePercentage += ((NSNumber *)[self.currentPercentages objectAtIndex:idx]).floatValue;
    }
    
    CGFloat currentHeight = self.ezHeight;
    CGFloat currentWidth = self.ezWidth;
    CGFloat x = isHorizontal ? currentWidth*cumulativePercentage : 0.0;
    CGFloat y = isHorizontal ? 0.0 : currentHeight*cumulativePercentage;
    CGFloat width = isHorizontal ? currentWidth*percentage : currentWidth;
    CGFloat height = isHorizontal ? currentHeight : currentHeight*percentage;
    
    CGRect rect = CGRectMake(x, y, width, height);
    return rect;
}

- (void) removeSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void) removeCurrentViews {
    for (id viewObject in self.currentViews) {
        if ([viewObject isKindOfClass:[NSNull class]]) {
            continue;
        }
        UIView *view = viewObject;
        [view removeFromSuperview];
    }
}

- (EZLayoutContainerViewType) type {
    return self.shouldLayoutLandscape ? self.landscapeType : self.portraitType;
}

- (BOOL) shouldLayoutLandscape {
    return [UIDevice isLandscape] && self.landscapeViews && self.landscapePercentages;
}

- (NSArray *) currentViews {
    return  self.shouldLayoutLandscape ? self.landscapeViews : self.views;
}

- (NSArray *) currentPercentages {
    return self.shouldLayoutLandscape ? self.landscapePercentages : self.percentages;
}

- (BOOL) number:(CGFloat)num equalTo:(CGFloat)target withinRange:(CGFloat)range {
    return num >= target-range && num <= target+range;
}

@end
