//
//  UIViewController+KVConstraintExtensions.h
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 19/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KVConstraintExtensions)

#pragma mark - Apply LayoutGuide Constraint From view of ViewController to a specific view
/* These method is used to access applied LayoutGuide constraint from view of ViewController(self.view) to a specific view(toView).
 */
- (void)applyTopLayoutGuideConastrainToView:(UIView *)toView WithPadding:(CGFloat)padding NS_AVAILABLE_IOS(7_0);

- (void)applyBottomLayoutGuideConastrainToView:(UIView *)toView WithPadding:(CGFloat)padding NS_AVAILABLE_IOS(7_0);

#pragma mark - Access LayoutGuide Constraint From a specific View
/* This method is used to access applied LayoutGuide constraint if layout guide constraint is exist in self.view for fromView.
 */
- (NSLayoutConstraint*)accessAppliedTopLayoutGuideConstraintFromView:(UIView *)fromView NS_AVAILABLE_IOS(7_0);

- (NSLayoutConstraint*)accessAppliedBottomLayoutGuideConstraintFromView:(UIView *)fromView NS_AVAILABLE_IOS(7_0);

#pragma mark - Remove LayoutGuide Constraints From a specific View

/* These method is used to remove the layoutGuide constraint.
 * But you cann't remove default TopLayoutGuide and BottomLayoutGuide constraint
 */
- (void)removeAppliedTopLayoutGuideConstraintFromView:(UIView *)fromView NS_AVAILABLE_IOS(7_0);

- (void)removeAppliedBottomLayoutGuideConstraintFromView:(UIView *)fromView NS_AVAILABLE_IOS(7_0);

@end
