//
//  EZLayoutExampleTableViewCell.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 6/8/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "EZLayout.h"
#import "EZLayoutExampleTableViewCell.h"

@interface EZLayoutExampleTableViewCell()

@property (nonatomic, strong) EZLayoutContainerView *base;

@end

@implementation EZLayoutExampleTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupEZLayout];
        
    }
    return self;
}

- (void) setupEZLayout {
    
    UIImageView *imageView = [UIImageView ezMake:^(UIView *make) {
        make.backgroundColor = [UIColor blueColor];
        make.layer.cornerRadius = 8.0;
        make.ezAlignment = [EZLayoutAlignment topPercentage:0.1];
        make.ezSize = [EZLayoutSize fixedHeight:40 fixedWidth:40];
        make.layer.masksToBounds = YES;
    }];
    imageView.image = [UIImage imageNamed:@"profile_pic"];
    
    NSArray *buttons = [UIButton ezMakeViews:3 make:^(UIView *make, NSUInteger index) {
        UIButton *button = (UIButton *)make;
        button.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.6];
        button.ezAlignment = [EZLayoutAlignment topFixed:0 leftFixed:0];
        NSString *buttonTitle = [NSString stringWithFormat:@"Button %lu", index];
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }];
    
    UITextView *textView = [UITextView ezMakeBasic];
    textView.text = @"Lorem ipsum dipsum, Lorem ipsum dipsum, Lorem ipsum dipsum, Lorem ipsum dipsum, Lorem ipsum dipsum, Lorem ipsum dipsum, Lorem ipsum dipsum";
    textView.scrollEnabled = NO;
    textView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [UILabel ezMake:^(UIView *make) {
        make.ezAlignment = [EZLayoutAlignment topFixed:5.0 leftFixed:5.0];
    }];
    label.adjustsFontSizeToFitWidth = YES;
    label.font = [UIFont systemFontOfSize:16.0];
    label.text = @"EZLayout Example";
    
    EZLayoutContainerView *buttonContainer = [EZLayoutContainerView containerWithHorizontalViews:buttons
                                                                                     percentages:@[kEZThird, kEZThird, kEZThird]];
    EZLayoutContainerView *container1 = [EZLayoutContainerView containerWithVerticalViews:@[label, textView, buttonContainer]
                                                                             fixedHeights:@[@20, ezFlexDefault, @22]];
    
    self.base = [EZLayoutContainerView container];
    [_base horizontallyLayoutViews:@[imageView, container1] withFixedWidths:@[@60, ezFlexDefault]];
    [_base attachToTableViewCell:self];
}

@end
