//
//  KV_ApplyLayoutGuideConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 24/08/15.
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
    [self applyConstaint];
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Purple];
    [self.view addSubview:self.containerView];
}

-(void)applyConstaint
{
    // apply constrint with LayoutGuides of viewController
    [[self containerView] applyConstraintFitToSuperviewHorizontally];
    
    [self applyTopLayoutGuideConastrainToView:[self containerView] WithPadding:0];
    
    [self applyBottomLayoutGuideConastrainToView:[self containerView] WithPadding:54];
    
    //change the priority of constraint
    [self.containerView changeAppliedConstraintPriority:defualtLessMaxPriority forAttribute:NSLayoutAttributeLeading];
}

@end
