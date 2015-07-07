//
//  EZLayoutContainerView+Landscape.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 7/7/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutContainerView.h"

@interface EZLayoutContainerView (Landscape)

#pragma mark - Landscape Orientation
// Can be nil
// If nil and portrait supported, will translate to portrait layout
@property (nonatomic, strong, readonly) NSArray *landscapeViews;
@property (nonatomic, strong, readonly) NSArray *landscapePercentages;

/* Fill */
- (void) fillWithLandscapeView:(UIView *)landscapVeiew;

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


@end
