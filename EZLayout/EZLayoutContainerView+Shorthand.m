//
//  EZLayoutContainerView+Shorthand.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutContainerView+Shorthand.h"

@implementation EZLayoutContainerView (Shorthand)

#pragma mark - Portrait Orientation

/* Fill */
- (void) fill:(UIView *)view {
    [self fillWithView:view];
}

/* Dynamic */
// lays out views left to right
- (void) ezs_H_Views:(NSArray *)views percentages:(NSArray *)percentages {
    [self horizontallyLayoutViews:views withPercentages:percentages];
}

// Lays out views top to bottom
- (void) ezs_V_Views:(NSArray *)views percentages:(NSArray *)percentages {
    [self verticallyLayoutViews:views withPercentages:percentages];
}

/* Fixed + Dynamic */
// lays out views left to right
- (void) ezs_H_Views:(NSArray *)views widths:(NSArray *)widths {
    [self horizontallyLayoutViews:views withFixedWidths:widths];
}

// Lays out views top to bottom
- (void) ezs_V_Views:(NSArray *)views heights:(NSArray *)heights {
    [self verticallyLayoutViews:views withFixedHeights:heights];
}


#pragma mark - Landscape Orientation

/* Fill */
- (void) fillLandscape:(UIView *)view {
    [self fillWithLandscapeView:view];
}

/* Dynamic */
// lays out views left to right
- (void) ezs_H_LandscapeViews:(NSArray *)landscapeViews percentages:(NSArray *)landscapePercentages {
    [self horizontallyLayoutLandscapeViews:landscapeViews withLandscapePercentages:landscapePercentages];
}

// Lays out views top to bottom
- (void) ezs_V_LandscapeViews:(NSArray *)landscapeViews percentages:(NSArray *)landscapePercentages {
    [self verticallyLayoutLandscapeViews:landscapeViews withLandscapePercentages:landscapePercentages];
}


/* Fixed + Dynamic */
// lays out views left to right
- (void) ezs_H_LandscapeViews:(NSArray *)landscapeViews widths:(NSArray *)landscapeWidths {
    [self horizontallyLayoutLandscapeViews:landscapeViews withFixedLandscapeWidths:landscapeWidths];
}

// Lays out views top to bottom
- (void) ezs_V_LandscapeViews:(NSArray *)landscapeViews heights:(NSArray *)landscapeHeights {
    [self verticallyLayoutLandscapeViews:landscapeViews withFixedLandscapeHeights:landscapeHeights];
}

@end
