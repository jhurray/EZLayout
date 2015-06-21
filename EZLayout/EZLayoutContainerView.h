//
//  EZLayoutContainerView.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZLayoutContainerView : UIView

#pragma mark - Class Initializers
// Basic init
+ (instancetype) container;
// Initializers for portrait mode
+ (instancetype) containerFilledWithView:(UIView *)view;
+ (instancetype) containerWithHorizontalViews:(NSArray *)views percentages:(NSArray *)percentages;
+ (instancetype) containerWithVerticalViews:(NSArray *)views percentages:(NSArray *)percentages;
+ (instancetype) containerWithHorizontalViews:(NSArray *)views fixedWidths:(NSArray *)fixedWidths;
+ (instancetype) containerWithVerticalViews:(NSArray *)views fixedHeights:(NSArray *)fixedHeights;
// Initializer for the first container view
// starts EZLayout
// calls attachToViewController:
+ (instancetype) containerWithViewController:(UIViewController *)viewController;
// Initializer for the first container view
// starts EZLayout
// calls attachToTableViewCell:
+ (instancetype) containerWithTableViewCell:(UITableViewCell *)cell;
// Initializer for the first container view
// starts EZLayout
// calls attachToContainerView:
+ (instancetype) containerWithContainerView:(EZLayoutContainerView *)containerView;

#pragma mark - Instance Initializers
// Initializers for portrait mode
- (instancetype) initWithViewToFill:(UIView *)view;
- (instancetype) initWithHorizontalViews:(NSArray *)views percentages:(NSArray *)percentages;
- (instancetype) initWithVerticalViews:(NSArray *)views percentages:(NSArray *)percentages;
- (instancetype) initWithHorizontalViews:(NSArray *)views fixedWidths:(NSArray *)fixedWidths;
- (instancetype) initWithVerticalViews:(NSArray *)views fixedHeights:(NSArray *)fixedHeights;
// Initializer for the first container view
// starts EZLayout
// calls attachToViewController:
- (instancetype) initWithViewController:(UIViewController *)viewController;
// Initializer for the first container view
// starts EZLayout
// calls attachToTableViewCell:
- (instancetype) initWithTableViewCell:(UITableViewCell *)cell;
// Initializer for the first container view
// starts EZLayout
// calls attachToContainerView:
- (instancetype) initWithContainerView:(EZLayoutContainerView *)containerView;

// Used to start EZLayout
- (void) attachToViewController:(UIViewController *)viewController;
- (void) attachToTableViewCell:(UITableViewCell *)cell;
- (void) attachToContainerView:(EZLayoutContainerView *)containerView;

#pragma mark - Portrait Orientation
// Must be set
@property (nonatomic, strong, readonly) NSArray *views;
@property (nonatomic, strong, readonly) NSArray *percentages;

/* Fill */
- (void) fillWithView:(UIView *)view;

/* Dynamic */
// lays out views left to right
- (void) horizontallyLayoutViews:(NSArray *)views withPercentages:(NSArray *)percentages;
// Lays out views top to bottom
- (void) verticallyLayoutViews:(NSArray *)views withPercentages:(NSArray *)percentages;

/* Fixed + Dynamic */
// lays out views left to right
- (void) horizontallyLayoutViews:(NSArray *)views withFixedWidths:(NSArray *)widths;
// Lays out views top to bottom
- (void) verticallyLayoutViews:(NSArray *)views withFixedHeights:(NSArray *)heights;

#pragma mark - Landscape Orientation
// Can be nil
// If nil and portrait supported, will translate to portrait layout
@property (nonatomic, strong, readonly) NSArray *landscapeViews;
@property (nonatomic, strong, readonly) NSArray *landscapePercentages;

/* Fill */
- (void) fillWithLandscapeView:(UIView *)view;

/* Dynamic */
// lays out views left to right
- (void) horizontallyLayoutLandscapeViews:(NSArray *)landscapeViews withLandscapePercentages:(NSArray *)landscapePercentages;
// Lays out views top to bottom
- (void) verticallyLayoutLandscapeViews:(NSArray *)landscapeViews withLandscapePercentages:(NSArray *)landscapePercentages;

/* Fixed + Dynamic */
// lays out views left to right
- (void) horizontallyLayoutLandscapeViews:(NSArray *)landscapeViews withFixedLandscapeWidths:(NSArray *)landscapeWidths;
// Lays out views top to bottom
- (void) verticallyLayoutLandscapeViews:(NSArray *)landscapeViews withFixedLandscapeHeights:(NSArray *)landscapeHeights;

#pragma mark - Force Layout
// These should be called if views and/or percentages are  changed.
// Animated is wrapped in animation block
- (void) ezLayoutSubviews;
- (void) ezLayoutSubviewsAnimated;

#pragma mark - View Ordering 

@property (nonatomic) BOOL orderSubviewsByTag; // Defaults to 'true'

@end
