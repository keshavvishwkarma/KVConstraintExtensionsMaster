//
//  KV_ModifyConstraintVC.m
//  KVConstraintExtensionsExample
//
//  Created by Keshav on 24/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ModifyConstraintVC.h"

@interface KV_ModifyConstraintVC (){
    NSLayoutConstraint *constraint;
}

@property (strong, nonatomic) IBOutlet UIView *container;

@end

@implementation KV_ModifyConstraintVC

// lazy constraints
-(NSLayoutConstraint *)constraint{
    if (!constraint) {
        constraint = [self.container accessAppliedConstraintByAttribute:NSLayoutAttributeTop];
    }
    return constraint;
}

- (IBAction)panRecognizerDidFire:(UIPanGestureRecognizer *)panner
{
    if (self.constraint) {
        CGFloat offset = self.constraint.constant + [panner translationInView:self.view].y;
        offset = MAX(0, MIN(offset, self.view.bounds.size.height));
        self.constraint.constant = offset;
        [panner setTranslation:CGPointZero inView:self.view];
        [self.container updateModifyConstraints];
    }
}
@end
