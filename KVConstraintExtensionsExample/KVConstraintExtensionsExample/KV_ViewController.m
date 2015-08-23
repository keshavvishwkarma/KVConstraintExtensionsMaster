//
//  KV_ViewController.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ViewController.h"

@interface KV_ViewController ()

@end

@implementation KV_ViewController

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
    self.containerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    [self.view addSubview:self.containerView];
}

-(void)applyConstaint
{
    // here we are going to apply constraints
    [self.containerView applyLeadingPinConstraintToSuperviewWithPadding:0];
    [self.containerView applyTrailingPinConstraintToSuperviewWithPadding:0];
    
    //  we can also apply leading and trailing of containerView both by using the below method. But this method is only useful when both leading and trailing have same padding
    
    [self.containerView applyTopPinConstraintToSuperviewWithPadding:0];
    [self.containerView applyBottomPinConstraintToSuperviewWithPadding:54];
    
    //[self.containerView applyLeadingAndTrailingPinConstraintToSuperviewWithPadding:80];

}

- (IBAction)updateConstraintToggleAction:(id)sender
{
    [self.containerView accessAppliedConstraintByAttribute:NSLayoutAttributeTrailing completion:^(NSLayoutConstraint *expectedConstraint){
        if (expectedConstraint) {
            if (expectedConstraint.constant) {
                expectedConstraint.constant = 0;
            }else{
                expectedConstraint.constant = -CGRectGetWidth(self.view.frame);
            }
            [self.containerView updateModifyConstraintsWithAnimation:NULL];
        }
    }];
}


@end
