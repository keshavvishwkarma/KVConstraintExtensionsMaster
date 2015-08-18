//
//  NSLayoutConstraint+KVConstraintExtensions.h
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (KVConstraintExtensions)

UIKIT_EXTERN const CGFloat defualtMultiplier;
UIKIT_EXTERN const CGFloat defualtConstant;
UIKIT_EXTERN const NSLayoutRelation defualtRelation;
UIKIT_EXTERN const CGFloat defualtLessMaxPriority;

+ (CGFloat)defualtSpacingBetweenSiblings;
+ (CGFloat)defualtSpacingBetweenSuperview;
+ (BOOL)recognizedDirectionByAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toTttribute;
/* This method is used to trace the allready added constraints on receiver view
 */
+ (NSLayoutConstraint *)appliedConstraintForView:(UIView*)aView attribute:(NSLayoutAttribute)attribute;

- (BOOL)isEqualToConstraint:(NSLayoutConstraint *)aConstraint;
- (NSLayoutConstraint *)swapConstraintItems;
- (NSLayoutConstraint *)modifyConstraintRelatedBy:(NSLayoutRelation)relation;
- (NSLayoutConstraint *)modifyConstraintMultiplierBy:(CGFloat)multiplier;

@end

@interface NSArray (KV_ContainsConstraint)

- (NSLayoutConstraint *)containsAppliedConstraint:(NSLayoutConstraint *)appliedConstraint;

@end
