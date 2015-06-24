//
//  EZLayoutAlignment+Shorthand.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/22/15.
//  Copyr (c) 2015 Jeff Hurray. All rs reserved.
//

#import "EZLayoutAlignment.h"

typedef EZLayoutAlignment EZAlignment;

@interface EZLayoutAlignment (Shorthand)

/* 
 
 t -> Top
 
 b -> Bottom
 
 l -> Left
 
 r -> Right
 
 P -> Percentage
 
 F -> Fixed Length
 
*/

#pragma mark - P

+ (instancetype) ezs_tP:(CGFloat)tP;
+ (instancetype) ezs_bP:(CGFloat)bP;
+ (instancetype) ezs_lP:(CGFloat)lP;
+ (instancetype) ezs_rP:(CGFloat)rP;
+ (instancetype) ezs_tP:(CGFloat)tP lP:(CGFloat)lP;
+ (instancetype) ezs_tP:(CGFloat)tP rP:(CGFloat)rP;
+ (instancetype) ezs_bP:(CGFloat)bP lP:(CGFloat)lP;
+ (instancetype) ezs_bP:(CGFloat)bP rP:(CGFloat)rP;


#pragma mark - F

+ (instancetype) ezs_tF:(CGFloat)tF;
+ (instancetype) ezs_bF:(CGFloat)bF;
+ (instancetype) ezs_lF:(CGFloat)lF;
+ (instancetype) ezs_rF:(CGFloat)rF;
+ (instancetype) ezs_tF:(CGFloat)tF lF:(CGFloat)lF;
+ (instancetype) ezs_tF:(CGFloat)tF rF:(CGFloat)rF;
+ (instancetype) ezs_bF:(CGFloat)bF lF:(CGFloat)lF;
+ (instancetype) ezs_bF:(CGFloat)bF rF:(CGFloat)rF;


#pragma mark - P + F

+ (instancetype) ezs_tP:(CGFloat)tP lF:(CGFloat)lF;
+ (instancetype) ezs_tF:(CGFloat)tF lP:(CGFloat)lP;

+ (instancetype) ezs_tP:(CGFloat)tP rF:(CGFloat)rF;
+ (instancetype) ezs_tF:(CGFloat)tF rP:(CGFloat)rP;

+ (instancetype) ezs_bP:(CGFloat)bP lF:(CGFloat)lF;
+ (instancetype) ezs_bF:(CGFloat)bF lP:(CGFloat)lP;

+ (instancetype) ezs_bP:(CGFloat)bP rF:(CGFloat)rF;
+ (instancetype) ezs_bF:(CGFloat)bF rP:(CGFloat)rP;


@end
