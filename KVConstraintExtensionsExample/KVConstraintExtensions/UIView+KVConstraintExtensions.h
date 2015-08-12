//
//  UIView+KVConstraintExtensions.h
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KVConstraintExtensions)

+ (instancetype)prepareNewViewForConstraint;

#pragma mark - Generic methods
#pragma mark - To create constraints for superview

- (NSLayoutConstraint *)prepareConstraintToSuperviewAttribute:(NSLayoutAttribute)attribute1 attribute:(NSLayoutAttribute)attribute2 relation:(NSLayoutRelation)relation;

- (NSLayoutConstraint *)prepareEqualRelationPinConstraintToSuperview:(NSLayoutAttribute)attribute constant:(CGFloat)constant;

- (NSLayoutConstraint *)prepareEqualRelationPinRatioConstraintToSuperview:(NSLayoutAttribute)attribute multiplier:(CGFloat)multiplier;

#pragma mark - To create constraints for sibling views

- (NSLayoutConstraint *)prepareConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView relation:(NSLayoutRelation)relation;

- (NSLayoutConstraint *)prepareConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView multiplier:(CGFloat)multiplier;

#pragma mark - To create constraints for viewController LayoutGuide
/* These LayoutGuide methods added a LayoutGuideConstraint and also return it.
 */
- (NSLayoutConstraint *)prepareEqualRelationPinConastrainToTopLayoutGuideOfViewController:(UIViewController *)viewController WithPadding:(CGFloat)padding;

- (NSLayoutConstraint *)prepareEqualRelationPinConastrainToBottomLayoutGuideOfViewController:(UIViewController *)viewController WithPadding:(CGFloat)padding;

#pragma mark - Add constraints cumulative

- (void)applyPreparedConastrainInView:(NSLayoutConstraint *)constraint;

#pragma mark - Modify applied constraint of a UIView

- (void)changeAppliedConstraintPriorityBy:(UILayoutPriority)priority forAttribute:(NSLayoutAttribute)attribute;

- (void)replaceAppliedConastrainInView:(NSLayoutConstraint *)appliedConstraint replaceBy:(NSLayoutConstraint *)constraint;

#pragma mark - Access Applied Constraint By Attributes From a specific View

- (NSLayoutConstraint*)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute;

- (void)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute completion:(void (^)(NSLayoutConstraint *appliedConstraint))completion;

#pragma mark - Apply Pin Edges to Superview

- (void)applyLeftPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyRightPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyTopPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyBottomPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyLeadingPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyTrailingPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyCenterXPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyCenterYPinConstraintToSuperviewWithPadding:(CGFloat)padding;

// to add same leading and trailing pin to superview.
// these method may be use with n number of siblings of a superview.
- (void)applyLeadingAndTrailingPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyTopAndBottomPinConstraintToSuperviewWithPadding:(CGFloat)padding;

- (void)applyEqualWidthPinConstrainToSuperview;
- (void)applyEqualHeightPinConstrainToSuperview;

- (void)applyEqualHeightRatioPinConstrainToSuperview: (CGFloat)ratio;
- (void)applyEqualWidthRatioPinConstrainToSuperview: (CGFloat)ratio;

- (void)applyConstraintForCenterInSuperview;     /* Center horizontally and Vertically */
- (void)applyConstraintForVerticallyCenterInSuperview;    /* Center Vertically */
- (void)applyConstraintForHorizontallyCenterInSuperview;  /* Center horizontally */

- (void)applyConstraintFitToSuperview;
- (void)applyConstraintFitToSuperviewHorizontally;
- (void)applyConstraintFitToSuperviewVertically;

- (void)applyConstraintFitToSuperviewContentInset:(UIEdgeInsets)Insets;

#pragma mark - Apply self view constraints

- (void)applyAspectRatioConstrain;
- (void)applyWidthConstraint:(CGFloat)width;
- (void)applyHeightConstrain:(CGFloat) height;

#pragma mark - Apply Constraint between sibling views

- (void)applyConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView spacing:(CGFloat)spacing;

@end
