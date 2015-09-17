//
//  KV_SiblingConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 26/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_SiblingConstraintVC.h"

@interface KV_SiblingConstraintVC ()

@property (strong, nonatomic) UIView *firstView;
@property (strong, nonatomic) UIView *secondView;
@property (strong, nonatomic) UIView *thirdView;

@end

@implementation KV_SiblingConstraintVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Step 1 create & configure the view hierarchy for constraint first.
     */
    [self createAndConfigureViewHierarchy];
    
    /* Step 2 Apply the constraints by calling KVConstraintExtensions library methods which have prefix "apply" according to constraints by selected view.
     */
    [self applyConstaint];
}


-(void)applyConstaint
{
    // here setting the constraints for containerView
    [self.containerView applyConstraintForCenterInSuperview];
    [self.containerView applyEqualHeightRatioPinConstrainToSuperview:0.5];
    [self.containerView applyEqualWidthRatioPinConstrainToSuperview:0.7];
    
    [self.firstView applyLeadingPinConstraintToSuperviewWithPadding:16];
    [self.thirdView applyTrailingPinConstraintToSuperviewWithPadding:16];
    
    // here setting the Top & Bottom constraints for firstView
    [self.firstView  applyTopAndBottomPinConstraintToSuperviewWithPadding:20];
    // here setting the Top & Bottom constraints for secondView
    [self.secondView applyTopAndBottomPinConstraintToSuperviewWithPadding:30];
    // here setting the Top & Bottom constraints for thirdView
    [self.thirdView  applyTopAndBottomPinConstraintToSuperviewWithPadding:40];
    
    //  now here setting the Horizontal space between the views
    
    // These constraint in left to right that means that is positive direction
    [_firstView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofView:_secondView spacing:16];
    
    [_secondView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofView:_thirdView spacing:16];
    
    // now here setting the equal width constraints for all subviews of containerView.
    [_firstView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofView:_secondView spacing:0];
    [_secondView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofView:_thirdView spacing:0];
}


- (void)createAndConfigureViewHierarchy
{
    // here creating views
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Brown];
    
    self.firstView = [UIView prepareNewViewForAutoLayout];
    self.firstView.backgroundColor = [UIColor Green];
    
    self.secondView = [UIView prepareNewViewForAutoLayout];
    self.secondView.backgroundColor = [UIColor Red];
    
    self.thirdView = [UIView prepareNewViewForAutoLayout];
    self.thirdView.backgroundColor = [UIColor LightGreen];
    
    self.view.backgroundColor = [UIColor Teal];
    
    // Here configuring view hierarchy
    [self.containerView addSubview:self.firstView];
    [self.containerView addSubview:self.secondView];
    [self.containerView addSubview:self.thirdView];
    
    [self.view addSubview:self.containerView];
    
}

@end
