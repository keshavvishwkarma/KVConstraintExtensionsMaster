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

- (BOOL)equalsConstraint:(NSLayoutConstraint *)expectedConstraint;

// this method is used to trace the allready added constraints on view
+ (NSLayoutConstraint *)expectedConstraintForView:(UIView*)aview attribute:(NSLayoutAttribute)attribute;

@end

@interface NSArray (KV_ContainsConstraint)

- (NSLayoutConstraint *)containsExpectedConstraint:(NSLayoutConstraint *)expectedConstraint;

@end
