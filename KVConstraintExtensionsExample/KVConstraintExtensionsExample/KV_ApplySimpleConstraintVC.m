//
//  KV_ApplySimpleConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ApplySimpleConstraintVC.h"

@interface KV_ApplySimpleConstraintVC ()

@end

@implementation KV_ApplySimpleConstraintVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**************------Go Easy on Programatically constraints ------************/
    
    /* Just Two steps to Apply\Add constraints by programatically */
    
    /* Step 1 create & configure the view hierarchy for constraint first.
     */
    [self createAndConfigureViewHierarchy];
    
    /* Step 2 Apply the constraints by calling KVConstraintExtensions library methods which have prefix "apply" according to constraints by selected view.
     */
    // NOTE:- Read at least once it would be better for you.

    [self applyConstraints1];
    //    [self applyConstraints2];
    
}

-(void)applyConstraints1
{
    // Now we need to apply constraint on the view so first select view on which you want to add constraints.
    // here selected view is constainerView. we are going to add constraints on the constainerView
    // so we need to call methods which have prefix apply according to constraints by selected view.
    
    /******* Apply single constraint one by one in any view( containerView ) ************/
    // set top pin constraint
    [self.containerView applyTopPinConstraintToSuperview:40];
    // set bottom pin constraint
    [self.containerView applyBottomPinConstraintToSuperview:40];
    // set Leading pin constraint
    [self.containerView applyLeadingPinConstraintToSuperview:30];
    // set Trailing pin constraint
    [self.containerView applyTrailingPinConstraintToSuperview:20];
    
    // You can also apply the same leading and trailling by wrtting single line
    // so if both side spacing/padding same then you can use below methos
    // wich is Equal above applyLeadingPin and applyTrailingPin methods
    //    [self.containerView applyLeadingAndTrailingPinConstraintToSuperview:20];
    
}

-(void)applyConstraints2
{
    // Applying the same leading and trailling by wrtting single line of code.
    [self.containerView applyTopAndBottomPinConstraintToSuperview:40];
    
    // using view left & Right alignment instead of leading and trailling.
    [self.containerView applyLeftPinConstraintToSuperview:30];
    [self.containerView applyRightPinConstraintToSuperview:30];
    
    // NOTE:- Read at least once it would be better for you.
    
    /*
     //   LeadingPin constraint will have all most same layout effect as leftPin constraint can have.
     //   Similarly trailingPin constraint will have all most same layout effect as rightPin constraint can have.
     //   But in the constraints, leadingPin constraints is deferent from leftPin constraint and
     //   TrailingPin constraints is deferent from rightPin constraint.
     
     //   So we should be careful, when we are applying both constraints leadingPin and leftPin of a same view(superview) and constraints trailingPin and rightPin of a same view(superview).
     
     // Why we will careful ? because -
     // Case 1:
     // when you apply both leadingPin and leftPin constraints of a same view then view can have conflict.
     // if constraint padding(constant value) is same then no conflict other wise view must have conflict.
     // and it will break the view constraint and then you have got some error in console
     
     // Similarly  Case 2:
     // when you apply both trailingPin and rightPin constraints of a same view then view can have conflict
     // if and only if constraint padding(constant value) is deferent. other wise no conflict.
     
     // if you have conflict then auto layout engine will break the constraints of view and let you know the reason with log in the console.
     EX;- Call both methos in viewDidLoad with deferent padding
     
     Either
     [self.containerView applyLeftPinConstraintToSuperview:30];
     [self.containerView applyLeadingAndTrailingPinConstraintToSuperview:20];
     OR
     [self.containerView applyTrailingPinConstraintToSuperview:20];
     [self.containerView applyRightPinConstraintToSuperview:30];
     
     
     //  Now you have got something like below in console log -
     (
     "<NSLayoutConstraint:0x89e9fd0 H:|-(20)-[UIView:0x89ea3a0]   (Names: '|':UIView:0x89ead80 )>",
     "<NSLayoutConstraint:0x89eb6a0 H:|-(30)-[UIView:0x89ea3a0](LTR)   (Names: '|':UIView:0x89ead80 )>"
     )
     Here one constraint try to set let position of containerView by 20 Px and other constraint try to set let position of containerView by 30 Px So thats a constraint conflict.
     to resolve this constraint we needs to set the priority of constraint with the help of priority auto-layout engine it self decide which constraint is less important to left.
     
     But in case, both constraints padding/spacing is same then there is no conflict because
     both are trying to set same position of containerView that possible.
     
     Same case will also happen with trailingPin and rightPin constraints try it yourself to understand.
     
     */
    
}

- (void)createAndConfigureViewHierarchy
{
    [self.view setBackgroundColor:[UIColor Teal]];
    
    self.containerView = [UIView prepareAutoLayoutView];
    self.containerView.backgroundColor = [UIColor Green];
    [self.view addSubview:self.containerView];
}

@end
