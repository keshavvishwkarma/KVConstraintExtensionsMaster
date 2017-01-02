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
    [self applyConstraint];

    // for scrollView
    [self configureScrollViewHierarchyAndApplyConstraint];
}


-(void)applyConstraint
{
    // here setting the constraints for containerView
    [self.containerView applyConstraintForHorizontallyCenterInSuperview];
    
    [self.containerView applyCenterYPinConstraintToSuperview:60];
    
    // this method is only used to increase the Constant Value of the CenterY constraint on Ipad with its Ratio

    [self.containerView updateAppliedConstraintConstantValueForIpadByAttribute:NSLayoutAttributeCenterY];

    [self.containerView applyEqualHeightRatioPinConstrainToSuperview:0.5];
    [self.containerView applyEqualWidthRatioPinConstrainToSuperview:0.7];
    
    [self.firstView applyLeadingPinConstraintToSuperview:16];
    [self.thirdView applyTrailingPinConstraintToSuperview:16];
    
    // here setting the Top & Bottom constraints for firstView
    [self.firstView  applyTopAndBottomPinConstraintToSuperview:20];
    // here setting the Top & Bottom constraints for secondView
    [self.secondView applyTopAndBottomPinConstraintToSuperview:30];
    // here setting the Top & Bottom constraints for thirdView
    [self.thirdView  applyTopAndBottomPinConstraintToSuperview:40];
    
    //  now here setting the Horizontal space between the views
    
    // These constraint in left to right that means that is positive direction
    [_firstView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofView:_secondView spacing:16];
    
    [_secondView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofView:_thirdView spacing:16];
    
    // now here setting the equal width constraints for all subviews of containerView.
    [_firstView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofView:_secondView spacing:0];
    [_secondView applyConstraintFromSiblingViewAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofView:_thirdView spacing:0];
    
    
    // Here we are trying to accessing the constraints between sibling views
//    NSLayoutConstraint *appliedConstrint = [_secondView accessAppliedConstraintFromSiblingViewByAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofView:_thirdView];

//    KVLog(@"%@",appliedConstrint);
    
}

- (void)createAndConfigureViewHierarchy
{
    // here creating views
    self.containerView = [UIView prepareAutoLayoutView];
    self.containerView.backgroundColor = [UIColor Brown];
    
    self.firstView = [UIView prepareAutoLayoutView];
    self.firstView.backgroundColor = [UIColor Green];
    
    self.secondView = [UIView prepareAutoLayoutView];
    self.secondView.backgroundColor = [UIColor Red];
    
    self.thirdView = [UIView prepareAutoLayoutView];
    self.thirdView.backgroundColor = [UIColor Teal];
    
    // Here configuring view hierarchy
    [self.containerView addSubview:self.firstView];
    [self.containerView addSubview:self.secondView];
    [self.containerView addSubview:self.thirdView];
    
    [self.view addSubview:self.containerView];
    
}


- (void)configureScrollViewHierarchyAndApplyConstraint
{
    UIScrollView *scrollView = [UIScrollView prepareAutoLayoutView];
    scrollView.backgroundColor = [UIColor Brown];

    [self.view addSubview:scrollView];
    UIView *containerView = [UIView prepareAutoLayoutView];
    containerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];

    [scrollView addSubview:containerView];
    
    CGFloat space = 8;

    UIEdgeInsets contentInset = UIEdgeInsetsMake(20, space, HUGE_VALF, space);
    [scrollView applyConstraintFitToSuperviewContentInset:contentInset];
    [scrollView applyHeightConstraint:100];
    
    // this method is only used to increase the Constant Value of the height constraint on Ipad with its Ratio
    [scrollView updateAppliedConstraintConstantValueForIpadByAttribute:NSLayoutAttributeHeight];
    
    // 1. Define the containerView y Position and height
    [containerView applyConstraintForVerticallyCenterInSuperview];
    
    // Here I'm applying the height constraints based on ratio
    [containerView applyEqualHeightRatioPinConstrainToSuperview:(1-(2*space)*0.01)];

    // 1. Define the containerView X Position
    [containerView applyLeadingAndTrailingPinConstraintToSuperview:space];
    
    NSInteger count  = 20;
    UIButton *previousContentButton = nil;

    for (NSInteger i = 0; i < count; i++)
	{
        UIButton *contentButton = [UIButton prepareAutoLayoutView];
        if (i&1) {
            [contentButton setBackgroundColor:[UIColor Green]];
        }else{
            [contentButton setBackgroundColor:[UIColor Red]];
        }
        
        [contentButton setTag:i];
        [contentButton.layer setBorderWidth:1.5f];
        [contentButton.layer setBorderColor:[UIColor Indigo].CGColor];
        [containerView addSubview:contentButton];
        
        // Define the contentButton Size
        [contentButton applyTopAndBottomPinConstraintToSuperview:space];

        [contentButton applyAspectRatioConstraint];
        //OR
        //  [contentButton applyWidthConstraint:60.0];
        
        if (i == 0) // for first
        {
            [contentButton applyLeadingPinConstraintToSuperview:space];
        }
        else if (i == count-1) // for last
        {
            [previousContentButton applyConstraintFromSiblingViewAttribute:NSLayoutAttributeTrailing toAttribute:NSLayoutAttributeLeading ofView:contentButton spacing:space];

            [contentButton applyTrailingPinConstraintToSuperview:space];
        }
        else
        {
            [previousContentButton applyConstraintFromSiblingViewAttribute:NSLayoutAttributeTrailing toAttribute:NSLayoutAttributeLeading ofView:contentButton spacing:space];
        }
        
        previousContentButton = contentButton;
    }
    
    [containerView updateModifyConstraints];
    
}


@end
