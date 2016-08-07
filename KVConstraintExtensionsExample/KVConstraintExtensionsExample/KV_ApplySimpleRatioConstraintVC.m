//
//  KV_ApplySimpleRatioConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 8/8/16.
//  Copyright © 2016 Keshav. All rights reserved.
//

#import "KV_ApplySimpleRatioConstraintVC.h"

@implementation KV_ApplySimpleRatioConstraintVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* Just Two steps to Apply\Add constraints by programatically */
    
    /* Step 1 create & configure the view hierarchy for constraint first.
     */
    [self createAndConfigureViewHierarchy];
    
    /* Step 2 Apply the constraints by calling KVConstraintExtensions library methods which have prefix "apply" according to constraints by selected view. here selected view is containerView
     */
    [self applyConstaint];
    
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Brown];
    [self.view addSubview:self.containerView];
    
}

- (void)applyConstaint
{
    // Demostrate width and height Ratio Constrain programatically
    [self.containerView applyConstraintForCenterInSuperview];
    [self.containerView applyEqualWidthRatioPinConstrainToSuperview:0.6];
    [self.containerView applyEqualHeightRatioPinConstrainToSuperview:0.4];
}

@end
