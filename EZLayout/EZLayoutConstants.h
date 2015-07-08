//
//  EZLayoutConstants.h
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/26/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#ifndef EZLayoutExample_EZLayoutConstants_h
#define EZLayoutExample_EZLayoutConstants_h


/* DEBUG */

// YES: Dotted Lines will appear around all views to show their containment.
// NO: No dotted lines around views
#define kEZDebugMode YES


/* LAYOUT CONTAINTERS */

//Use this for blank space in a view
// self.views = @[view1, EZLayoutBlankSpace, view2];
#define kEZLayoutBlankSpace [NSNull null]
// Shorthand syntax
#define kEZBlankSpace kEZLayoutBlankSpace

/* WORDS */

#define kEZOne @1.0
#define kEZWhole @1.0

#define kEZHalf @(1.0/2.0)

#define kEZThird @(1.0/3.0)
#define kEZTwoThirds @(2.0/3.0)

#define kEZFourth @(1.0/4.0)
#define kEZThreeFourths @(3.0/4.0)

#define kEZFifth @(1.0/5.0)
#define kEZTwoFifths @(2.0/5.0)
#define kEZThreeFifths @(3.0/5.0)
#define kEZFourFifths @(4.0/5.0)

#define kEZSixth @(1.0/6.0)
#define kEZFiveSixths @(5.0/6.0)

#define kEZSeventh @(1.0/7.0)
#define kEZTwoSevenths @(2.0/7.0)
#define kEZThreeSevenths @(3.0/7.0)
#define kEZFourSevenths @(4.0/7.0)
#define kEZFiveSevenths @(5.0/7.0)
#define kEZSixSevenths @(6.0/7.0)

#define kEZEight @(1.0/8.0)
#define kEZThreeEighths @(3.0/8.0)
#define kEZFiveEighths @(5.0/8.0)
#define kEZSevenEighths @(7.0/8.0)

#define kEZNinth @(1.0/9.0)
#define kEZNTwoNinths @(2.0/9.0)
#define kEZNFourNinths @(4.0/9.0)
#define kEZNFiveNinths @(5.0/9.0)
#define kEZNSevenNinths @(7.0/9.0)
#define kEZNEightNinths @(8.0/9.0)

#define kEZTenth @(1.0/10.0)
#define kEZThreeTenths @(3.0/10.0)
#define kEZSevenTenths @(7.0/10.0)
#define kEZNineTenths @(9.0/10.0)


#define kEZTwelfth @(1.0/12.0)
#define kEZFiveTwelfths @(5.0/12.0)
#define kEZSevenTwelfths @(7.0/12.0)
#define kEZElevenTwelfths @(11.0/12.0)

#define kEZFifteenth @(1.0/15.0)
#define kEZTwoFifteenths @(2.0/15.0)
#define kEZFourFifteenths @(4.0/15.0)
#define kEZSevenFifteenths @(7.0/15.0)
#define kEZEightFifteenths @(8.0/15.0)
#define kEZElevenFifteenths @(11.0/15.0)
#define kEZThirteenFifteenths @(13.0/15.0)
#define kEZFourteenFifteenths @(14.0/15.0)


#define kEZSixteenth @(1.0/16.0)
#define kEZThreeSixteenths @(3.0/16.0)
#define kEZFiveSixteenths @(5.0/16.0)
#define kEZSevenSixteenths @(7.0/16.0)
#define kEZNineSixteenths @(9.0/16.0)
#define kEZElevenSixteenths @(11.0/16.0)
#define kEZThirteenSixteenths @(13.0/16.0)
#define kEZFifteenSixteenths @(15.0/16.0)

#define kEZTwentieth @(1.0/20.0)
#define kEZThreeTwentieths @(3.0/20.0)
#define kEZSevenTwentieths @(7.0/20.0)
#define kEZNineTwentieths @(9.0/20.0)
#define kEZElevenTwentieths @(11.0/20.0)
#define kEZThirteenTwentieths @(13.0/20.0)
#define kEZSeventeenTwentieths @(17.0/20.0)
#define kEZNineteenTwentieths @(19.0/20.0)

/* NUMBERS */

#define kEZ1 @1.0

#define kEZ_1_2 @(1.0/2.0)

#define kEZ_1_3 @(1.0/3.0)
#define kEZ_2_3 @(2.0/3.0)

#define kEZ_1_4 @(1.0/4.0)
#define kEZ_3_4 @(3.0/4.0)

#define kEZ_1_5 @(1.0/5.0)
#define kEZ_2_5 @(2.0/5.0)
#define kEZ_3_5 @(3.0/5.0)
#define kEZ_4_5 @(4.0/5.0)

#define kEZSixth @(1.0/6.0)
#define kEZFiveSixths @(5.0/6.0)

#define kEZ_1_7 @(1.0/7.0)
#define kEZ_2_7 @(2.0/7.0)
#define kEZ_3_7 @(3.0/7.0)
#define kEZ_4_7 @(4.0/7.0)
#define kEZ_5_7 @(5.0/7.0)
#define kEZ_6_7 @(6.0/7.0)

#define kEZ_1_8 @(1.0/8.0)
#define kEZ_3_8 @(3.0/8.0)
#define kEZ_5_8 @(5.0/8.0)
#define kEZ_7_8 @(7.0/8.0)

#define kEZ_1_9 @(1.0/9.0)
#define kEZ_2_9 @(2.0/9.0)
#define kEZ_4_9 @(4.0/9.0)
#define kEZ_5_9 @(5.0/9.0)
#define kEZ_7_9 @(7.0/9.0)
#define kEZ_8_9 @(8.0/9.0)

#define kEZ_1_10 @(1.0/10.0)
#define kEZ_3_10 @(3.0/10.0)
#define kEZ_7_10 @(7.0/10.0)
#define kEZ_9_10 @(9.0/10.0)


#define kEZ_1_12 @(1.0/12.0)
#define kEZ_5_12 @(5.0/12.0)
#define kEZ_7_12 @(7.0/12.0)
#define kEZ_11_12 @(11.0/12.0)

#define kEZ_1_15 @(1.0/15.0)
#define kEZ_2_15 @(2.0/15.0)
#define kEZ_4_15 @(4.0/15.0)
#define kEZ_7_15 @(7.0/15.0)
#define kEZ_8_15 @(8.0/15.0)
#define kEZ_11_15 @(11.0/15.0)
#define kEZ_13_15 @(13.0/15.0)
#define kEZ_14_15 @(14.0/15.0)


#define kEZ_1_16 @(1.0/16.0)
#define kEZ_3_16 @(3.0/16.0)
#define kEZ_5_16 @(5.0/16.0)
#define kEZ_7_16 @(7.0/16.0)
#define kEZ_9_16 @(9.0/16.0)
#define kEZ_11_16 @(11.0/16.0)
#define kEZ_13_16 @(13.0/16.0)
#define kEZ_15_16 @(15.0/16.0)

#define kEZ_1_20 @(1.0/20.0)
#define kEZ_3_20 @(3.0/20.0)
#define kEZ_7_20 @(7.0/20.0)
#define kEZ_9_20 @(9.0/20.0)
#define kEZ_11_20 @(11.0/20.0)
#define kEZ_13_20 @(13.0/20.0)
#define kEZ_17_20 @(17.0/20.0)
#define kEZ_19_20 @(19.0/20.0)


#endif
