//
//  ViewController.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 5/23/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "ViewController.h"
#import "EZLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *v1 = [UIView ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize widthPercentage:0.5 scaleFactor:1.0];
        make.ezAlignment = [EZLayoutAlignment topPercentage:0.05 leftPercentage:0.0];
        make.backgroundColor = [UIColor blueColor];
    }];

    EZLayoutContainerView *v2 = [EZLayoutContainerView ezMake:^(UIView *make) {
        make.ezSize =  [EZLayoutSize heightPercentage:0.8 widthPercentage:0.8];
        make.backgroundColor = [UIColor redColor];
    }];
    
    NSArray *yellowViews = [UIView ezMakeViews:3 make:^(UIView *make, NSUInteger index) {
        make.backgroundColor = [UIColor yellowColor];
        make.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.9];
        make.ezAlignment = [EZLayoutAlignment bottomPercentage:0.05];
    }];
    
    EZLayoutContainerView *container1 = [[EZLayoutContainerView alloc] initWithViewController:self];
    [v2 verticallyLayoutViews:@[yellowViews[0], yellowViews[1], yellowViews[2]] withPercentages:@[kEZThird, kEZThird, kEZThird]];
    [container1 horizontallyLayoutViews:@[v1, v2] withPercentages:@[kEZHalf, kEZHalf]];

/* The same as: */
//    UIView *v1 = [[UIView alloc] init];
//    v1.ezSize = [EZLayoutSize widthPercentage:0.5 scaleFactor:1.0];
//    v1.ezAlignment = [EZLayoutAlignment top:0.05 left:0];
//    v1.backgroundColor = [UIColor blueColor];
//    EZLayoutContainerView *v2 = [[EZLayoutContainerView alloc] init];
//    v2.ezSize = [EZLayoutSize heightPercentage:0.8 widthPercentage:0.8];
//    v2.backgroundColor = [UIColor redColor];
//    
//    
//    UIView *v3 = [[UIView alloc] init];
//    v3.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.9];
//    v3.ezAlignment = [EZLayoutAlignment bottom:0.05];
//    v3.backgroundColor = [UIColor yellowColor];
//    UIView *v4 = [[UIView alloc] init];
//    v4.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.9];
//    v4.ezAlignment = [EZLayoutAlignment bottom:0.05];
//    v4.backgroundColor = [UIColor yellowColor];
//    UIView *v5 = [[UIView alloc] init];
//    v5.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.9];
//    v5.ezAlignment = [EZLayoutAlignment bottom:0.05];
//    v5.backgroundColor = [UIColor yellowColor];
//    UIView *v6 = [[UIView alloc] init];
//    v6.ezSize = [EZLayoutSize heightPercentage:0.5 widthPercentage:0.9];
//    v6.ezAlignment = [EZLayoutAlignment bottom:0.05];
//    v6.backgroundColor = [UIColor yellowColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
