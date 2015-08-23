//
//  KV_MultipleConstraintsVC.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_MultipleConstraintsVC.h"

@interface KV_MultipleConstraintsVC ()

@end

@implementation KV_MultipleConstraintsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /* Just Two steps to Apply\Add constraints by programatically */
    
    /* Step 1 create & configure the view hierarchy for constraint first.
     */
    [self createAndConfigureViewHierarchy];
    
    /* Step 2 Apply the constraints by calling KVConstraintExtensions library methods which have prefix "apply" according to constraints by selected view.
     */
    // NOTE :- run at a time either applyConstaint1 or applyConstaint2 methods

//    [self applyConstaint1];
    [self applyConstaint2];
    
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Brown];
    [self.view addSubview:self.containerView];
}

- (void)applyConstaint1
{
    // Demostrate width and height Ratio Constrain programatically
    [self.containerView applyConstraintForCenterInSuperview];
    [self.containerView applyEqualWidthRatioPinConstrainToSuperview:0.6];
    [self.containerView applyEqualHeightRatioPinConstrainToSuperview:0.4];
}

- (void)applyConstaint2
{
    // 1. Define the containerView Position
    [self.containerView applyTopPinConstraintToSuperviewWithPadding:20];
    [self.containerView applyConstraintFitToSuperviewHorizontally];
    
    CGFloat height = 80;
    CGFloat width  = 60;
    CGFloat space  = 16;
    
    for (NSInteger i = 0; i < 5; i++)
	{
        UIButton *contentButton = [UIButton prepareNewViewForAutoLayout];
        if (i&1) {
            [contentButton setBackgroundColor:[UIColor Green]];
        }else{
            [contentButton setBackgroundColor:[UIColor Red]];
        }
        [contentButton.layer setBorderWidth:1.0f];
        [contentButton.layer setBorderColor:[UIColor Indigo].CGColor];
        [self.containerView addSubview:contentButton];
        
        // 2. Define the contentButton Size
        [contentButton applyHeightConstrain:height];
        [contentButton applyWidthConstraint:width];
        
        // 3. Define the contentButton Position
        [contentButton applyTopPinConstraintToSuperviewWithPadding:space];
        [contentButton applyBottomPinConstraintToSuperviewWithPadding:space];
        [contentButton applyLeftPinConstraintToSuperviewWithPadding:((i*width +(i+1)*space))];
    }
}

@end
