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
- (void)prepareViewForConstraint;

#pragma mark - Generic methods to create constraints for views

- (NSLayoutConstraint *)prepareEqualRelationPinConstraintToSuperview:(NSLayoutAttribute)attribute constant:(CGFloat)constant;

- (NSLayoutConstraint *)prepareEqualRelationPinRatioConstraintToSuperview:(NSLayoutAttribute)attribute multiplier:(CGFloat)multiplier;

#pragma mark - Add constraints cumulative

- (void)addPreparedConastrainInView:(NSLayoutConstraint *)constraint;

#pragma mark - Apply Pin Edges to Superview

- (void)applyLeftPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyRightPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyTopPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyBottomPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyLeadingPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyTrailingPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyCenterXPinConstraintToSuperviewWithPadding:(CGFloat)padding;
- (void)applyCenterYPinConstraintToSuperviewWithPadding:(CGFloat)padding;

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

- (void)applyWidthConstraint:(CGFloat)width;
- (void)applyHeightConstrain:(CGFloat) height;

- (void)applyAspectRatioConstrain; /* not cumulative */


#pragma mark - Access expected constraint from a reciever view

- (NSLayoutConstraint*)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute;

- (void)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute completion:(void (^)(NSLayoutConstraint *appliedConstraint))completion;

@end
