//
//  KV_ConstraintWithAnimationVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 21/09/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ConstraintWithAnimationVC.h"

@interface KV_ConstraintWithAnimationVC ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *headingLabel;

@end

@implementation KV_ConstraintWithAnimationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self createAndConfigureViewHierarchy];
    
    [self applyConstaint];
    
}

- (void)applyConstaint
{
    [[self containerView] applyTopPinConstraintToSuperview:50.0f];
    [[self containerView] applyLeadingAndTrailingPinConstraintToSuperview:20];
    [[self containerView] applyHeightConstraint:50];
    
    [[self textField] applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(8, 5, 4, 5)];
    [[self headingLabel] applyConstraintFromSiblingViewAttribute:NSLayoutAttributeCenterY toAttribute:NSLayoutAttributeCenterY ofView:[self textField] spacing:defaultConstant];
    
    [[self headingLabel] applyLeftPinConstraintToSuperview:5];
    [[self headingLabel] applyHeightConstraint:16.0f];
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Brown];
    [self.view addSubview:self.containerView];
    
    self.view.backgroundColor = [UIColor Red];
    
    self.textField = [UITextField prepareNewViewForAutoLayout];
    self.textField.backgroundColor = [UIColor Red];
    self.textField.backgroundColor = [UIColor clearColor];
    self.textField.placeholder     = @"Please enter the password.";
    self.textField.delegate = self;
    
    [self.containerView addSubview:self.textField];
    
    self.headingLabel = [UILabel prepareNewViewForAutoLayout];
    self.headingLabel.backgroundColor = [UIColor Orange];
    self.headingLabel.backgroundColor = [UIColor clearColor];
    self.headingLabel.text = self.textField.placeholder;
    self.headingLabel.hidden = YES;
    [self.headingLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.containerView addSubview:self.headingLabel];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLayoutConstraint * constraint = [[self headingLabel] prepareConstraintFromSiblingViewAttribute:NSLayoutAttributeCenterY toAttribute:NSLayoutAttributeCenterY ofView:[self textField] multiplier:defaultMultiplier];
    
    NSLayoutConstraint *appliedConstraint = [self.containerView.constraints containsAppliedConstraint:constraint];
    [appliedConstraint setConstant:-CGRectGetHeight(textField.bounds)/2.0];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.headingLabel.hidden = NO;
        [self.headingLabel updateModifyConstraints];
    } completion:NULL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    NSLayoutConstraint * constraint = [[self headingLabel] prepareConstraintFromSiblingViewAttribute:NSLayoutAttributeCenterY toAttribute:NSLayoutAttributeCenterY ofView:[self textField] multiplier:defaultMultiplier];
    
    NSLayoutConstraint *appliedConstraint = [self.containerView.constraints containsAppliedConstraint:constraint];
    [appliedConstraint setConstant:defaultConstant];
    
    [UIView animateWithDuration:0.2f animations:^{
        [self.headingLabel updateModifyConstraints];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25f animations:^{
            self.headingLabel.hidden = YES;
        }];
    }];
    
    return YES;
}


@end
