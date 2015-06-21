//
//  UITextView+EZLayout.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/21/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "UITextView+EZLayout.h"

@implementation UITextView (EZLayout)

- (void)resizeFontToFit
{
    // Only run if has text, otherwise it will make infinity loop
    if (self.text.length == 0 || CGSizeEqualToSize(self.bounds.size, CGSizeZero)) return;
    
    /*
     - Update textView font size
     If expectHeight > textViewHeight => descrease font size n point until it reach textViewHeight
     If expectHeight < textViewHeight => inscrease font size n point until it reach textViewHeight
     */
    CGSize textViewSize = self.frame.size;
    CGFloat fixedWidth = textViewSize.width;
    CGSize expectSize = [self sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    
    UIFont *expectFont = self.font;
    if (expectSize.height > textViewSize.height) {
        while ([self sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)].height > textViewSize.height) {
            expectFont = [self.font fontWithSize:(self.font.pointSize-1)];
            self.font = expectFont;
        }
    } else {
        while ([self sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)].height < textViewSize.height) {
            expectFont = self.font;
            self.font = [self.font fontWithSize:(self.font.pointSize+1)];
        }
        self.font = expectFont;
    }
}

@end
