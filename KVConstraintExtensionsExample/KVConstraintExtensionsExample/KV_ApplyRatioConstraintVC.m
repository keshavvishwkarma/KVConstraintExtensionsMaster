//
//  KV_ApplyRatioConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ApplyRatioConstraintVC.h"

@interface KV_ApplyRatioConstraintVC ()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;

@end

@implementation KV_ApplyRatioConstraintVC

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
    [self applyVerticallyDistributedConstraintsOnButtons];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    KVLog(@"Top space = %@",@(CGRectGetMinY(self.button1.frame)));
    KVLog(@"Space between button1 & button2 = %@",@(CGRectGetMinY(self.button2.frame)-CGRectGetMaxY(self.button1.frame)));
    KVLog(@"Space between button2 & button3 = %@",@(CGRectGetMinY(self.button3.frame)-CGRectGetMaxY(self.button2.frame)));
    KVLog(@"Bottom space = %@",@(CGRectGetHeight(self.containerView.frame)-CGRectGetMaxY(self.button3.frame)));
    
}

-(void)applyVerticallyDistributedConstraintsOnButtons
{
    // setting constraint for the containerView
    CGFloat const padding = 6.0f;

    [self.containerView applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(padding, padding, padding,padding)];
    
    // Here setting the horizontal center of buttons
    // means OriginX possition of view
    [self.button1 applyConstraintForHorizontallyCenterInSuperview];
    [self.button2 applyConstraintForHorizontallyCenterInSuperview];
    [self.button3 applyConstraintForHorizontallyCenterInSuperview];
    
    // if we not get it then we needs to calculate it dynamically by text or something else
    CGFloat const buttonHeight = 34.0f;
    CGFloat const numberOfButtons = 3.0f;
    
    // here setting OriginY possition of view in percentaage.
    [self.button1 applyCenterYRatioPinConstrainToSuperview:(defaultMultiplier-(1.0f/(numberOfButtons-1))) padding:-(buttonHeight/(numberOfButtons+1))];
    
    [self.button2 applyConstraintForVerticallyCenterInSuperview];
    
    [self.button3 applyCenterYRatioPinConstrainToSuperview:(defaultMultiplier+(1.0f/(numberOfButtons-1))) padding:(buttonHeight/(numberOfButtons+1))];
    
    [self.containerView updateModifyConstraints];
}


-(void)distributeVerticallyButtons
{
    // seting constraint for containner view
    [self.containerView applyConstraintFitToSuperview];
    
    // if we have not got height of button then we needs to calculate it dynamically by text or something else
    CGFloat const buttonHeight = 34.0f;
    CGFloat const numberOfButtons = 3.0f;
    
    NSArray *buttons = @[self.button1,self.button2,self.button3];
    
    NSInteger middelIndex = floorf((buttons.count/2.0f));
    
    // reference view to distrybute other view
    [buttons[middelIndex] applyConstraintForCenterInSuperview];
    
    // processing for after midel button list
    while ( (middelIndex +1)< buttons.count)
    {
        [buttons[++middelIndex] applyCenterYRatioPinConstrainToSuperview:(defaultMultiplier+(1.0f/(numberOfButtons-1))) padding:(buttonHeight/(numberOfButtons+1))];
        [buttons[middelIndex] applyConstraintForHorizontallyCenterInSuperview];
    }
    
    middelIndex = floorf((buttons.count/2.0f));
    // processing for before midel button list
    while ((middelIndex - 1) != -1)
    {
        [buttons[--middelIndex] applyCenterYRatioPinConstrainToSuperview:(defaultMultiplier-(1.0f/(numberOfButtons-1))) padding:-(buttonHeight/(numberOfButtons+1))];
        
        [buttons[middelIndex] applyConstraintForHorizontallyCenterInSuperview];
    }
    
    [self.containerView updateModifyConstraints];
}


- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Teal];
    [self.view addSubview:self.containerView];
    
    self.button1 = [UIButton prepareNewViewForAutoLayout];
    self.button1.backgroundColor = [UIColor Red];
    [self.containerView addSubview:self.button1];
    
    self.button2 = [UIButton prepareNewViewForAutoLayout];
    self.button2.backgroundColor = [UIColor Green];
    [self.containerView addSubview:self.button2];
    
    self.button3 = [UIButton prepareNewViewForAutoLayout];
    self.button3.backgroundColor = [UIColor Brown];
    [self.containerView addSubview:self.button3];
    
    [self.button1 setTitle:@"button1" forState:UIControlStateNormal];
    [self.button2 setTitle:@"button2" forState:UIControlStateNormal];
    [self.button3 setTitle:@"button3" forState:UIControlStateNormal];
    
}

@end

