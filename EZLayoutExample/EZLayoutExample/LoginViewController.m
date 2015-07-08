//
//  LoginViewController.m
//  EZLayoutExample
//
//  Created by Jeff Hurray on 7/8/15.
//  Copyright (c) 2015 Jeff Hurray. All rights reserved.
//

#import "LoginViewController.h"
#import "EZLayout.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *usernameTeftField;
@property (strong, nonatomic) UITextField *passwordTextField;

@property (strong, nonatomic) UIButton *loginButton;

@property(strong, nonatomic) UITextView *descriptionTextView;

@property (strong, nonatomic) UILabel *welcomeLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutViews];
    [self setupViews];
}

- (void) setupViews {

    self.welcomeLabel.text = @"Welcome to my app!";
    self.welcomeLabel.textAlignment = NSTextAlignmentCenter;
    
    self.usernameTeftField.placeholder = @"Username";
    self.usernameTeftField.textAlignment = NSTextAlignmentCenter;
    self.usernameTeftField.delegate = self;
    
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    self.passwordTextField.delegate = self;
    
    self.descriptionTextView.text = @"A description about my app blah blah blah blah blah ipsum lipsum dorem etc...";
    self.descriptionTextView.editable = NO;
    self.descriptionTextView.scrollEnabled = NO;
    self.descriptionTextView.backgroundColor = [UIColor clearColor];
    
    [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.backgroundColor =[UIColor blueColor];
}

- (void) layoutViews {
    self.usernameTeftField = [UITextField ezMakeBasic];
    self.passwordTextField = [UITextField ezMakeBasic];
    self.descriptionTextView = [UITextView ezMakeBasic];
    self.descriptionTextView.frameWasSetBlock = ezFrameWasSetBlock() {
        [self.descriptionTextView resizeFontToFit];
    };
    self.welcomeLabel = [UILabel ezMakeBasic];
    self.loginButton = [UIButton ezMake:^(UIView *make) {
        make.ezSize = [EZLayoutSize heightPercentage:0.8 widthPercentage:0.8];
    }];

    EZLayoutContainerView *base = [EZLayoutContainerView containerWithViewController:self];
    [base verticallyLayoutViews:@[_welcomeLabel, _usernameTeftField, _passwordTextField, _descriptionTextView, _loginButton] withPercentages:@[@0.1, @0.15, @0.15, @0.45, @0.15]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

@end
