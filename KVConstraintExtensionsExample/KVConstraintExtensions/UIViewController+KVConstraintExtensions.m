//
//  UIViewController+KVConstraintExtensions.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 19/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "UIViewController+KVConstraintExtensions.h"
#import "UIView+KVConstraintExtensions.h"
#import "NSLayoutConstraint+KVConstraintExtensions.h"

@implementation UIViewController (KVConstraintExtensions)

#pragma mark - common private Layout Guide constraint methods
// to create
- (NSLayoutConstraint*)prepareLayoutGuideConstraintToView:(UIView *)toView WithPadding:(CGFloat)padding isTopLayoutGuide:(BOOL)isTopLayoutGuide {
    NSLayoutConstraint *preparedConstraint = nil;
    [toView prepareViewForConstraint];
    
    NSAssert(([self view] != toView), @"you are passing wrong view and fromView must not be distinct from self.view of ViewController.");
    NSAssert(toView, @"fromView must not be nil.");
    
    if (isTopLayoutGuide) {
        preparedConstraint = [NSLayoutConstraint constraintWithItem:toView                                                                           attribute:NSLayoutAttributeTop relatedBy:defualtRelation toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:defualtMultiplier constant:padding];
    }
    else{
        preparedConstraint = [NSLayoutConstraint constraintWithItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop relatedBy:defualtRelation toItem:toView attribute:NSLayoutAttributeBottom multiplier:defualtMultiplier constant:padding];
    }
    
    return preparedConstraint;
}

- (NSLayoutConstraint*)accessAppliedLayoutGuideConstraintFromView:(UIView *)fromView isTopLayoutGuide:(BOOL)isTopLayoutGuide
{
    __block NSLayoutConstraint *appliedConstraint = nil;
    __block id<UILayoutSupport>layoutGuide   = isTopLayoutGuide ? self.topLayoutGuide : self.bottomLayoutGuide;
    NSLayoutAttribute viewAttribute          = isTopLayoutGuide ? NSLayoutAttributeTop : NSLayoutAttributeBottom;
    NSLayoutAttribute layoutGuideAttribute   = isTopLayoutGuide ? NSLayoutAttributeBottom : NSLayoutAttributeTop;
    
    [self.view.constraints enumerateObjectsUsingBlock: ^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop)
     {
         if ( ((constraint.firstItem == layoutGuide)&&(constraint.secondItem == fromView)) || ((constraint.secondItem == layoutGuide)&&(constraint.firstItem == fromView)) )
         {
             if (self.view == fromView) {
                 if (NSLayoutAttributeTop == (constraint.firstAttribute|constraint.secondAttribute)) {
                     appliedConstraint = constraint;
                 }else  if (NSLayoutAttributeBottom == (constraint.firstAttribute|constraint.secondAttribute)) {
                     appliedConstraint = constraint;
                 }else{
                     NSLog(@"NOT Found");
                 }
             }
             else if (((constraint.firstItem == layoutGuide) && (constraint.firstAttribute == layoutGuideAttribute)) && ((constraint.secondItem == fromView) && (constraint.secondAttribute == viewAttribute))) {
                 appliedConstraint = constraint;
             } else if (((constraint.secondItem == layoutGuide) && (constraint.secondAttribute == layoutGuideAttribute)) && ((constraint.firstItem == fromView) && (constraint.firstAttribute == viewAttribute))) {
                 appliedConstraint = constraint;
             } else {
                 NSLog(@"NOT Found");
             }
         }
     }];
    
    return appliedConstraint;
}


- (void)applyTopLayoutGuideConastrainToView:(UIView *)toView WithPadding:(CGFloat)padding {
    NSLayoutConstraint *preparedConstraint = [self prepareLayoutGuideConstraintToView:toView WithPadding:padding isTopLayoutGuide:YES];
    [self.view applyPreparedConastrainInView:preparedConstraint];
}
- (void)applyBottomLayoutGuideConastrainToView:(UIView *)toView WithPadding:(CGFloat)padding {
    NSLayoutConstraint *preparedConstraint = [self prepareLayoutGuideConstraintToView:toView WithPadding:padding isTopLayoutGuide:NO];
    [self.view applyPreparedConastrainInView:preparedConstraint];
}

- (NSLayoutConstraint*)accessAppliedTopLayoutGuideConstraintFromView:(UIView *)fromView{
    return [self accessAppliedLayoutGuideConstraintFromView:fromView isTopLayoutGuide:YES];
}
- (NSLayoutConstraint*)accessAppliedBottomLayoutGuideConstraintFromView:(UIView *)fromView{
    return [self accessAppliedLayoutGuideConstraintFromView:fromView isTopLayoutGuide:NO];
}

- (void)removeAppliedTopLayoutGuideConstraintFromView:(UIView *)fromView{
    if (self.view != fromView)
    {
        NSLayoutConstraint *appliedConstraint = [self accessAppliedTopLayoutGuideConstraintFromView:fromView];
        if (appliedConstraint) [self.view removeConstraint:appliedConstraint];
    }
}

- (void)removeAppliedBottomLayoutGuideConstraintFromView:(UIView *)fromView{
    if (self.view != fromView){
        NSLayoutConstraint *appliedConstraint = [self accessAppliedBottomLayoutGuideConstraintFromView:fromView];
        if (appliedConstraint) [self.view removeConstraint:appliedConstraint];
    }
}

@end
