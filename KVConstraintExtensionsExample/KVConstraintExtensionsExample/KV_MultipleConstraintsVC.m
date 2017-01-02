//
//  KV_MultipleConstraintsVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_MultipleConstraintsVC.h"

@interface KV_MultipleConstraintsVC ()

@property (strong, nonatomic) UIView *secondView;

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
    [self applyConstraint2];
    [self applyConstraint3];

}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareAutoLayoutView];
    self.containerView.backgroundColor = [UIColor Brown];
    [self.view addSubview:self.containerView];

    self.secondView = [UIView prepareAutoLayoutView];
    self.secondView.backgroundColor = [UIColor Brown];
    [self.view addSubview:self.secondView];

}

//- (void)applyConstraint1
//{
//    // Demostrate width and height Ratio Constrain programatically
//    [self.containerView applyConstraintForCenterInSuperview];
//    [self.containerView applyEqualWidthRatioPinConstrainToSuperview:0.6];
//    [self.containerView applyEqualHeightRatioPinConstrainToSuperview:0.4];
//}

- (void)applyConstraint2
{
    // 1. Define the containerView Position
    [self.containerView applyTopPinConstraintToSuperview:20];
    [self.containerView applyConstraintFitToSuperviewHorizontally];
    
    CGFloat height = 80;
    CGFloat width  = 60;
    CGFloat space  = 16;
    
    for (NSInteger i = 0; i < 4; i++)
	{
        UIButton *contentButton = [UIButton prepareAutoLayoutView];
        if (i&1) {
            [contentButton setBackgroundColor:[UIColor Green]];
        }else{
            [contentButton setBackgroundColor:[UIColor Red]];
        }
        [contentButton.layer setBorderWidth:1.0f];
        [contentButton.layer setBorderColor:[UIColor Indigo].CGColor];
        [self.containerView addSubview:contentButton];
        
        // 2. Define the contentButton Size
        [contentButton applyHeightConstraint:height];
        [contentButton applyWidthConstraint:width];
        
        // 3. Define the contentButton Position
        [contentButton applyTopPinConstraintToSuperview:space];
        [contentButton applyBottomPinConstraintToSuperview:space];
        [contentButton applyLeftPinConstraintToSuperview:((i*width +(i+1)*space))];
    }
}
/*******************************
 * Apply multiple constraint so easily
 ********************/

- (void)applyConstraint3
{
//1. this method add four constraint (in order top, left, bottom, right) by writing only single
//    [self.redView applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(50, 30, 50, 20)];

//2. To avoid any constraint pin top, left, bottom or right, then just simply put any value INFINITY/HUGE_VALF in contentInset because any constraint can not have INFINITY constant.

[self.secondView applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(INFINITY, 30, HUGE_VALF, 20)];

// here you left two constraint Top and Bottom so view con not determine the height of the view and Y-Position of the view. So now you need to satisfied Y-Position of the view.
[self.secondView applyCenterYPinConstraintToSuperview:50];

// now applied constraints are sufficient but still view will not display/visible because view is not determine any height from the applied constraints so by default view set its height zero. So better is to give some height
[self.secondView applyHeightConstraint:80];

}


@end
