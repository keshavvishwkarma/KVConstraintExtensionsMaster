//
//  UIView+KVConstraintExtensions.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KVConstraintExtensions.h"

@implementation UIView (KVConstraintExtensions)

#pragma mark - Initializer Methods

+ (instancetype)prepareNewAutoLayoutView {
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

- (void)prepareViewForAutoLayout {
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

#pragma mark - private constraint methods for views

+ (NSLayoutConstraint *)prepareConastrainForView:(UIView*)firstView  attribute:(NSLayoutAttribute)attribute1 secondView:(UIView*)secondView attribute:(NSLayoutAttribute)attribute2 relation:(NSLayoutRelation)relation multiplier:(CGFloat)multiplier
{
    NSAssert((firstView||secondView), @"both firstView & secondView must not be nil.");
    NSAssert(multiplier!=INFINITY, @"Multiplier/Ratio of view must not be INFINITY.");
    return [NSLayoutConstraint constraintWithItem:firstView attribute:attribute1 relatedBy:relation toItem:secondView attribute:attribute2 multiplier:multiplier constant:defualtConstant];
}

- (NSLayoutConstraint *)prepareSelfConastrain:(NSLayoutAttribute)attribute constant:(CGFloat)constant
{
    NSLayoutConstraint *prepareSelfConastrain = [self.class prepareConastrainForView:self attribute:attribute secondView:nil attribute:NSLayoutAttributeNotAnAttribute relation:defualtRelation multiplier:defualtMultiplier];
    [prepareSelfConastrain setConstant:constant];
    return prepareSelfConastrain;
}

#pragma mark - Generalized public constraint methods for views

- (NSLayoutConstraint *)prepareConstraintToSuperviewAttribute:(NSLayoutAttribute)attribute1 attribute:(NSLayoutAttribute)attribute2 relation:(NSLayoutRelation)relation
{
    return [self.class prepareConastrainForView:self attribute:attribute1 secondView:[self superview] attribute:attribute2 relation:relation multiplier:defualtMultiplier];
}

- (NSLayoutConstraint *)prepareEqualRelationPinConstraintToSuperview:(NSLayoutAttribute)attribute constant:(CGFloat)constant
{
    NSLayoutConstraint *preparePinConastrain = [self prepareConstraintToSuperviewAttribute:attribute attribute:attribute relation:defualtRelation];
    [preparePinConastrain setConstant:constant];
    return preparePinConastrain;
}

- (NSLayoutConstraint *)prepareEqualRelationPinRatioConstraintToSuperview:(NSLayoutAttribute)attribute multiplier:(CGFloat)multiplier
{
    NSAssert(multiplier!=INFINITY, @"Multiplier/Ratio of view must not be INFINITY.");

    // note if ratio is equal to zero then its ratio prefered 1.0 that is defualtMultiplier
    NSLayoutConstraint *preparedPinRatioConastrain = [self.class prepareConastrainForView:self attribute:attribute secondView:[self superview] attribute:attribute relation:defualtRelation multiplier:multiplier?multiplier:defualtMultiplier];
    return preparedPinRatioConastrain;
}

- (void)constraintForSiblingsView:(UIView*)siblingView attribute1:(NSLayoutAttribute)attribute1 attribute2:(NSLayoutAttribute)attribute2 spacing:(CGFloat)spacing
{
    NSAssert(spacing!=INFINITY, @"Spacing between sybings view must not be INFINITY.");
    
    NSLayoutConstraint *prepareConstraintForSiblingView = [self.class prepareConastrainForView:self attribute:attribute1 secondView:siblingView attribute:attribute2 relation:defualtRelation multiplier:defualtMultiplier];
    [prepareConstraintForSiblingView setConstant:spacing];
    [self.superview addPreparedConastrainInView:prepareConstraintForSiblingView];
}

#pragma mark -

/** This is the common methods two add cumulative constraint in a view
 * for this you need to call it according to view (self or Superview)
 */
- (void)addPreparedConastrainInView:(NSLayoutConstraint *)constraint {
    NSLayoutConstraint *expectedConstraint = [self.constraints containsExpectedConstraint:constraint];
    // if this constraint is already added then it update the constraint values else added new constraint
    if (expectedConstraint) {
        [expectedConstraint setConstant:constraint.constant];
    } else {
        if (constraint) {
            [self addConstraint:constraint];
        }
    }
}

#pragma mark - Pin Edges to Superview
// adding or updating the constraint
- (void)addPreparedEqualRelationPinConstraintToSuperview:(NSLayoutAttribute)attribute constant:(CGFloat)constant {
    NSAssert(self.superview, @"You should have addSubView %@ on any other its called's Superview ", self);
    NSAssert(constant!=INFINITY, @"Constant must not be INFINITY.");
    [self.superview addPreparedConastrainInView:[self prepareEqualRelationPinConstraintToSuperview:attribute constant:constant]];
}

- (void)applyLeftPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeLeft constant:padding];
}
- (void)applyRightPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeRight constant:-padding];
}
- (void)applyTopPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeTop constant:padding];
}
- (void)applyBottomPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeBottom constant:-padding];
}
- (void)applyLeadingPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeLeading constant:padding];
}
- (void)applyTrailingPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeTrailing constant:-padding];
}
- (void)applyCenterXPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeCenterX constant:padding];
}
- (void)applyCenterYPinConstraintToSuperviewWithPadding:(CGFloat)padding {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeCenterY constant:padding];
}
- (void)applyEqualWidthPinConstrainToSuperview {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeWidth constant:defualtConstant];
}
- (void)applyEqualHeightPinConstrainToSuperview {
    [self addPreparedEqualRelationPinConstraintToSuperview:NSLayoutAttributeHeight constant:defualtConstant];
}

- (void)applyEqualHeightRatioPinConstrainToSuperview:(CGFloat)ratio {
    // first method to get equal Ratio constraint
    NSAssert(self.superview, @" Superview must not be nil.\n For View: %@", self);
    NSAssert(ratio!=INFINITY, @" Ratio must not be INFINITY.");
    
    NSLayoutConstraint *equalHeightRatioPinConstraint = [self prepareEqualRelationPinRatioConstraintToSuperview:NSLayoutAttributeHeight multiplier:ratio];
    if (equalHeightRatioPinConstraint) {
        [self.superview addPreparedConastrainInView:equalHeightRatioPinConstraint];
    }
}

- (void)applyEqualWidthRatioPinConstrainToSuperview:(CGFloat)ratio {
    // first method to get equal Ratio constraint
    NSAssert(self.superview, @" Superview of this view must not be nil.\n For View: %@", self);
    NSAssert(ratio!=INFINITY, @" Ratio must not be INFINITY.");
    
    NSLayoutConstraint *equalHeightRatioPinConstraint = [self prepareEqualRelationPinRatioConstraintToSuperview:NSLayoutAttributeWidth multiplier:ratio];
    if (equalHeightRatioPinConstraint) {
        [self.superview addPreparedConastrainInView:equalHeightRatioPinConstraint];
    }
}

/*  Center horizontally and Vertically  */
- (void)applyConstraintForCenterInSuperview {
    [self applyCenterXPinConstraintToSuperviewWithPadding:defualtConstant];
    [self applyCenterYPinConstraintToSuperviewWithPadding:defualtConstant];
}

- (void)applyConstraintForVerticallyCenterInSuperview {
    [self applyCenterYPinConstraintToSuperviewWithPadding:defualtConstant];
}

- (void)applyConstraintForHorizontallyCenterInSuperview {
    [self applyCenterXPinConstraintToSuperviewWithPadding:defualtConstant];
}

- (void)applyConstraintFitToSuperview {
    // First way
    [self applyConstraintFitToSuperviewContentInset:UIEdgeInsetsZero];
    
    // OR Second way to do the same thing
    /* [self applyEqualHeightPinConstrainToSuperview];
     [self applyEqualWidthPinConstrainToSuperview];
     [self applyConstraintForCenterInSuperview];
     */
}

- (void)applyConstraintFitToSuperviewHorizontally{
    [self applyRightPinConstraintToSuperviewWithPadding:defualtConstant];
    [self applyLeftPinConstraintToSuperviewWithPadding:defualtConstant];
}
- (void)applyConstraintFitToSuperviewVertically{
    //    INFINITY/HUGE_VALF is used to exclude the constraint from the view
    [self applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(0, INFINITY, 0, HUGE_VALF)];
}

- (void)applyConstraintFitToSuperviewContentInset:(UIEdgeInsets)Insets {
    if (Insets.top!=INFINITY) {
        [self applyTopPinConstraintToSuperviewWithPadding:Insets.top];
    }
    if (Insets.left!=INFINITY) {
        [self applyLeftPinConstraintToSuperviewWithPadding:Insets.left];
    }
    if (Insets.bottom!=INFINITY) {
        [self applyBottomPinConstraintToSuperviewWithPadding:Insets.bottom];
    }
    if (Insets.right!=INFINITY) {
        [self applyRightPinConstraintToSuperviewWithPadding:Insets.right];
    }
}

#pragma mark - Apply self constraints

- (void)applyWidthConstraint:(CGFloat)width {
    if (width!=INFINITY) {
        [self addPreparedConastrainInView:[self prepareSelfConastrain:NSLayoutAttributeWidth constant:width]];
    }else {
        NSLog(@"Width of the view con not be INFINITY");
    }
}

- (void)applyHeightConstrain:(CGFloat) height {
    if (height!=INFINITY) {
        [self addPreparedConastrainInView:[self prepareSelfConastrain:NSLayoutAttributeHeight constant:height]];
    } else {
        NSLog(@"Height of the view con not be INFINITY");
    }
}

- (void)applyAspectRatioConstrain {
    [self addPreparedConastrainInView:[self.class prepareConastrainForView:self attribute:NSLayoutAttributeWidth secondView:self attribute:NSLayoutAttributeHeight relation:defualtRelation multiplier:defualtMultiplier]];
}

#pragma mark - Modify constraint of a UIView

- (void)accessExpectedConstraint:(NSLayoutAttribute)attribute completion:(void (^)(NSLayoutConstraint *expectedConstraint))completion
{
    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSLayoutConstraint expectedConstraintForView:self attribute:attribute]);
        });
    }
}

@end
