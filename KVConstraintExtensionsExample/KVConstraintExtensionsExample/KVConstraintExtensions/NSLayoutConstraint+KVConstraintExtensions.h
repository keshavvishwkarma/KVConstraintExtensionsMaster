//
//  NSLayoutConstraint+KVConstraintExtensions.h
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (KVConstraintExtensions)

UIKIT_EXTERN const CGFloat defualtMultiplier ;
UIKIT_EXTERN const CGFloat defualtConstant ;
UIKIT_EXTERN const NSLayoutRelation defualtRelation;

+ (CGFloat)defualtSpacingBetweenSiblings;
+ (CGFloat)defualtSpacingBetweenSuperview;

- (BOOL)isEqualToConstraint:(NSLayoutConstraint *)aConstraint;

// this method is used to trace the allready added constraints on view
+ (NSLayoutConstraint *)appliedConstraintForView:(UIView*)aView attribute:(NSLayoutAttribute)attribute;

@end

@interface NSArray (KV_ContainsConstraint)

- (NSLayoutConstraint *)containsAppliedConstraint:(NSLayoutConstraint *)appliedConstraint;

@end
