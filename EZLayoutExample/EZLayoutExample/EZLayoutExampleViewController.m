//
//  EZLayoutExampleViewController.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/19/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayout.h"
#import "EZLayoutExampleViewController.h"

@interface EZLayoutExampleViewController()

@property (strong, nonatomic) UITextView *detailTextView;
@property (strong, nonatomic) UIImageView *profileImageView;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UILabel *coolStuffLabel;

@end

@implementation EZLayoutExampleViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    // Where the magic happens
    [self setupEZLayout];
    
    // Setup views programatically
    self.detailTextView.backgroundColor = [UIColor whiteColor];
    self.detailTextView.textColor = [UIColor grayColor];
    self.detailTextView.text = @"Hi I'm Jeff Hurray. That's me and the Venus de Milo. I made EZLayout because I am not a fan of interface builder or Autolayout. EZLayout is expressive and flexible. It is the easiest way to create dynamic layouts for multiple screen sizes.";
    self.detailTextView.font = [UIFont systemFontOfSize:12.0];
    self.detailTextView.layer.borderWidth = 5.0;
    self.detailTextView.layer.borderColor = [UIColor purpleColor].CGColor;
    self.detailTextView.editable = NO;
    self.detailTextView.scrollEnabled = NO;
    self.detailTextView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.profileImageView.backgroundColor = [UIColor cyanColor];
    self.profileImageView.image = [UIImage imageNamed:@"profile_pic"];
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.borderWidth = 5.0;
    self.profileImageView.layer.borderColor = [UIColor purpleColor].CGColor;
    
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.image = [UIImage imageNamed:@"background"];
    
    
    self.coolStuffLabel.backgroundColor = [UIColor whiteColor];
    self.coolStuffLabel.textColor = [UIColor grayColor];
    self.coolStuffLabel.text = @"Stuff I like";
    self.coolStuffLabel.font = [UIFont systemFontOfSize:18.0];
    self.coolStuffLabel.textAlignment = NSTextAlignmentCenter;
    self.coolStuffLabel.layer.cornerRadius = 8.0;
    self.coolStuffLabel.layer.borderWidth = 5.0;
    self.coolStuffLabel.layer.borderColor = [UIColor purpleColor].CGColor;
    self.coolStuffLabel.layer.masksToBounds = YES;
}

- (void) setupEZLayout {
    self.detailTextView = [UITextView ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize heightPercentage:0.8 widthPercentage:0.85];
        make.ezAlignment = [EZLayoutAlignment topFixed:0];
        make.layer.cornerRadius = 8.0;
        make.frameWasSetBlock = ezMakeBlock(make) {
            [self updateTextFont:self.detailTextView];
        };
    }];
    
    self.profileImageView = [UIImageView ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize heightPercentage:1.0 scaleFactor:1.0];
        make.ezAlignment = [EZLayoutAlignment bottomPercentage:-0.15];
        make.frameWasSetBlock = ezMakeBlock(make) {
            self.profileImageView.layer.cornerRadius = self.profileImageView.ezHeight/2.0;
        };
    }];
    
    EZLayoutContainerView *descriptionContainer = [EZLayoutContainerView container];
    [descriptionContainer verticallyLayoutViews:@[_profileImageView, _detailTextView] withPercentages:@[@0.35, @0.65]];
    
    self.coolStuffLabel = [UILabel ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize heightPercentage:1.0 widthPercentage:0.6];
    }];
    
    NSArray *coolStuffImageNames = @[@"tom_brady", @"starwars", @"corgis"];
    NSArray *coolStuffImages = [UIImageView ezMakeViews:3 make:^(UIView *make, NSUInteger index) {
        UIImageView *imageView = (UIImageView *)make;
        imageView.image = [UIImage imageNamed:coolStuffImageNames[index]];
        imageView.ezSize = [EZLayoutSize widthPercentage:0.85 scaleFactor:1.0];
        imageView.layer.cornerRadius = 8.0;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderWidth = 5.0;
        imageView.layer.borderColor = [UIColor purpleColor].CGColor;
    }];
    
    EZLayoutContainerView *coolStuffImageContainer = [EZLayoutContainerView containerWithHorizontalViews:coolStuffImages
                                                                                             percentages:@[kEZThird, kEZThird, kEZThird]];
    
    EZLayoutContainerView *coolStuffContainer = [EZLayoutContainerView ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize heightPercentage:0.85 widthPercentage:0.85];
    }];
    [coolStuffContainer verticallyLayoutViews:@[ self.coolStuffLabel, coolStuffImageContainer] withPercentages:@[@0.2, @0.8]];
    
    self.backgroundImageView = [UIImageView ezMakeBasic];
    EZLayoutContainerView *imageContainer = [EZLayoutContainerView container];
    [imageContainer horizontallyLayoutViews:@[self.backgroundImageView] withPercentages:@[@1.0]];
    
    EZLayoutContainerView *base = [EZLayoutContainerView containerWithViewController:self];
    [base verticallyLayoutViews:@[descriptionContainer, coolStuffContainer] withPercentages:@[@0.5, @0.5]];
    [base horizontallyLayoutLandscapeViews:@[descriptionContainer, coolStuffContainer] withLandscapePercentages:@[@0.5, @0.5]];
    [imageContainer attachToContainerView:base];
    
}

- (void)updateTextFont:(UITextView *)textView
{
    // Only run if has text, otherwise it will make infinity loop
    if (textView.text.length == 0 || CGSizeEqualToSize(textView.bounds.size, CGSizeZero)) return;
    
    /*
     - Update textView font size
     If expectHeight > textViewHeight => descrease font size n point until it reach textViewHeight
     If expectHeight < textViewHeight => inscrease font size n point until it reach textViewHeight
     */
    CGSize textViewSize = textView.frame.size;
    CGFloat fixedWidth = textViewSize.width;
    CGSize expectSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    
    UIFont *expectFont = textView.font;
    if (expectSize.height > textViewSize.height) {
        while ([textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)].height > textViewSize.height) {
            expectFont = [textView.font fontWithSize:(textView.font.pointSize-1)];
            textView.font = expectFont;
        }
    } else {
        while ([textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)].height < textViewSize.height) {
            expectFont = textView.font;
            textView.font = [textView.font fontWithSize:(textView.font.pointSize+1)];
        }
        textView.font = expectFont;
    }
}

@end
