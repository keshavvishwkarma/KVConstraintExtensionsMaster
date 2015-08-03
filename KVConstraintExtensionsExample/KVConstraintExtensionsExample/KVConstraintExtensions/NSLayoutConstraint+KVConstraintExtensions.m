//
//  NSLayoutConstraint+KVConstraintExtensions.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KVConstraintExtensions.h"

#pragma mark - Defualt constants values

const CGFloat defualtMultiplier = 1.0f;
const CGFloat defualtConstant =  0.0f;
const NSLayoutRelation defualtRelation = NSLayoutRelationEqual;

@implementation NSLayoutConstraint (KVConstraintExtensions)

+ (CGFloat)defualtSpacingBetweenSiblings
{
    static NSLayoutConstraint *constraint;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       UIView *view = [UIView prepareNewAutoLayoutView];
       constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"[view]-[view]"                                                              options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)].firstObject;
    });
    
    return constraint.constant; // 20.0 expected
}

+ (CGFloat)defualtSpacingBetweenSuperview
{
    static NSLayoutConstraint *constraint;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       UIView *view = [UIView prepareNewAutoLayoutView];
       UIView *Superview = [UIView prepareNewAutoLayoutView];
       [Superview addSubview:view];
       constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[view]"                                                                                 options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)].firstObject;
    });
    
    return constraint.constant; // 20.0 expected
}


- (BOOL)equalsConstraint:(NSLayoutConstraint *)expectedConstraint {
    if (self.firstItem == expectedConstraint.firstItem &&
        self.firstAttribute == expectedConstraint.firstAttribute &&
        self.relation == expectedConstraint.relation &&
        self.secondItem == expectedConstraint.secondItem &&
        self.secondAttribute == expectedConstraint.secondAttribute &&
        self.multiplier == expectedConstraint.multiplier ) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isSelfConstraintAttribute:(NSLayoutAttribute)attribute {
    if ((attribute == NSLayoutAttributeWidth)||(attribute == NSLayoutAttributeHeight)||(attribute == (NSLayoutAttributeWidth|NSLayoutAttributeHeight))) {
        return YES;
    }
    return NO;
}

+ (NSLayoutConstraint *)expectedConstraintForView:(UIView*)aview attribute:(NSLayoutAttribute)attribute {
    assert(aview!=nil);
    
    if ([self isSelfConstraintAttribute:attribute]) {
        
        NSLog(@"Tracing constrain in subview constraints, count = %@",@(aview.constraints.count));
        for (NSLayoutConstraint *actualConstraint in aview.constraints)
        {
            if ( (actualConstraint.firstItem == nil && actualConstraint.secondItem == aview)||
                (actualConstraint.firstItem == aview && actualConstraint.secondItem == nil) )
            {
                // In this case, this constraintint may be either widthConstraint or heightConstrain
                if (attribute == (actualConstraint.firstAttribute|actualConstraint.secondAttribute)) {
                    return actualConstraint;
                }
            }
            else if ( (actualConstraint.firstItem == aview )&&(actualConstraint.secondItem == aview ))
            {
                // In this case, this constraintint is only aspectRatioConstrain
                if (attribute == (actualConstraint.firstAttribute|actualConstraint.secondAttribute)) {
                    return actualConstraint;
                }
            } else {
                /* do some stuff for other work*/
            }
        }
    }
    else
    {
        NSLog(@"Tracing constrain in superview constraints, count = %@",@(aview.constraints.count));
        
        for (NSLayoutConstraint *actualConstraint in aview.superview.constraints)
        {
            if ( ((actualConstraint.firstItem == aview)&&(actualConstraint.secondItem == aview.superview))||
                ((actualConstraint.secondItem == aview )&&(actualConstraint.firstItem == aview.superview)) )
            {
                // In this case, this constraintint is only aspectRatioConstrain
                if ( (attribute == actualConstraint.firstAttribute)&&
                    (attribute == actualConstraint.secondAttribute) ) {
                    return actualConstraint;
                }
                else {
                    /* do some stuff for other work*/
                }
            }
        }
    }
    
    return nil;
}

@end

@implementation NSArray (KV_ContainsConstraint)

- (NSLayoutConstraint *)containsExpectedConstraint:(NSLayoutConstraint *)expectedConstraint{
    for (NSLayoutConstraint *actualConstraint in self) {
        if ([actualConstraint equalsConstraint:expectedConstraint])
            return actualConstraint;
    }
    return nil;
}

@end