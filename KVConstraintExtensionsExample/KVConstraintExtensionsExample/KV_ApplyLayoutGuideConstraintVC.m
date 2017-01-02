//
//  KV_ApplyLayoutGuideConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ApplyLayoutGuideConstraintVC.h"

@interface KV_ApplyLayoutGuideConstraintVC ()

@end

@implementation KV_ApplyLayoutGuideConstraintVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Step 1 create & configure the view hierarchy for constraint first.
     */
    [self createAndConfigureViewHierarchy];
    
    /* Step 2 Apply the constraints by calling KVConstraintExtensions library methods which have prefix "apply" according to constraints by selected view.
     */
    [self applyConstraint];
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareAutoLayoutView];
    self.containerView.backgroundColor = [UIColor Purple];
    [self.view addSubview:self.containerView];
}

-(void)applyConstraint
{
    // apply constrint with LayoutGuides of viewController
    [[self containerView] applyConstraintFitToSuperviewHorizontally];
    
    [self applyTopLayoutGuideConstraintToView:[self containerView] WithPadding:0];
    
    [self applyBottomLayoutGuideConstraintToView:[self containerView] WithPadding:54];
    
    // change the priority of constraint
    // [self.containerView changeAppliedConstraintPriority:defaultLessMaxPriority forAttribute:NSLayoutAttributeLeading];
}

@end
