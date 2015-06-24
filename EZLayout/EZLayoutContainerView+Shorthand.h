//
//  EZLayoutContainerView+Shorthand.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayoutContainerView.h"

typedef EZLayoutContainerView EZContainer;

@interface EZLayoutContainerView (Shorthand)

/*
 H -> Horizontal
 
 V -> Vertical
 
 widths -> fixedWidths
 
 heights -> fixedHeights
 
 */

#pragma mark - Portrait Orientation

/* Fill */
- (void) fill:(UIView *)view;

/* Dynamic */
// lays out views left to right
- (void) ezs_H_Views:(NSArray *)views percentages:(NSArray *)percentages;
// Lays out views top to bottom
- (void) ezs_V_Views:(NSArray *)views percentages:(NSArray *)percentages;

/* Fixed + Dynamic */
// lays out views left to right
- (void) ezs_H_Views:(NSArray *)views widths:(NSArray *)widths;
// Lays out views top to bottom
- (void) ezs_V_Views:(NSArray *)views heights:(NSArray *)heights;


#pragma mark - Landscape Orientation

/* Fill */
- (void) fillLandscape:(UIView *)view;

/* Dynamic */
// lays out views left to right
- (void) ezs_H_LandscapeViews:(NSArray *)landscapeViews percentages:(NSArray *)landscapePercentages;
// Lays out views top to bottom
- (void) ezs_V_LandscapeViews:(NSArray *)landscapeViews percentages:(NSArray *)landscapePercentages;

/* Fixed + Dynamic */
// lays out views left to right
- (void) ezs_H_LandscapeViews:(NSArray *)landscapeViews widths:(NSArray *)landscapeWidths;
// Lays out views top to bottom
- (void) ezs_V_LandscapeViews:(NSArray *)landscapeViews heights:(NSArray *)landscapeHeights;

@end
