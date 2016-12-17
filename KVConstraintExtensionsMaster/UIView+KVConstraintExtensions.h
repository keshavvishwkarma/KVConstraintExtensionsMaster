//
//  UIView+KVConstraintExtensions.h
//  https://github.com/keshavvishwkarma/KVConstraintExtensionsMaster.git
//
//  Distributed under the MIT License.
//
//  Copyright (c) 2015 Keshav Vishwkarma
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIKit/UIKit.h>

@interface UIView (KVConstraintExtensions)

/** This method is used to create new instance of ui elements for autolayout.
 */
+ (instancetype)prepareNewViewForAutoLayout;

/** This method is used to prepare already created instance of ui elements for autolayout.
 */
- (void)prepareViewForAutoLayout;

#pragma mark - Generic methods
#pragma mark - To create constraints for superview

- (NSLayoutConstraint *)prepareConstraintToSuperviewAttribute:(NSLayoutAttribute)attribute1 attribute:(NSLayoutAttribute)attribute2 relation:(NSLayoutRelation)relation;

- (NSLayoutConstraint *)prepareEqualRelationPinConstraintToSuperview:(NSLayoutAttribute)attribute constant:(CGFloat)constant;

- (NSLayoutConstraint *)prepareEqualRelationPinRatioConstraintToSuperview:(NSLayoutAttribute)attribute multiplier:(CGFloat)multiplier;

#pragma mark - To create constraints for sibling views

- (NSLayoutConstraint *)prepareConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView relation:(NSLayoutRelation)relation;

- (NSLayoutConstraint *)prepareConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView multiplier:(CGFloat)multiplier;

#pragma mark - Add constraints cumulative

- (void)applyPreparedConstraintInView:(NSLayoutConstraint *)constraint;

#pragma mark - Remove Constraints From a specific View

/*!
 This method is used to remove all the its related constraint from the its superview.
 */
- (void)removeAppliedConstraintFromSupreview;

/*!
 This method is used to remove all constraint (self + superview).
 */
- (void)removeAllAppliedConstraints;

#pragma mark - Modify applied constraint of a UIView

/*!
 This method is used to change the priority of constraint.
 */
- (void)changeAppliedConstraintPriority:(UILayoutPriority)priority forAttribute:(NSLayoutAttribute)attribute;

/*!
 This method is used to replace already applied constraint by new constraint.
 */
- (void)replaceAppliedConstraintInView:(NSLayoutConstraint *)appliedConstraint replaceBy:(NSLayoutConstraint *)constraint;

- (void)updateModifyConstraints;

- (void)updateModifyConstraintsWithAnimation:(void (^)(BOOL finished))completion;

- (void)updateAppliedConstraintConstantValueByAttribute:(NSLayoutAttribute)attribute withConstantRatio:(CGFloat)constantRatio;

- (void)updateAppliedConstraintConstantValueForIpadByAttribute:(NSLayoutAttribute)attribute;

- (void)updateAppliedConstraintConstantValueForIphoneByAttribute:(NSLayoutAttribute)attribute;

- (void)scaleFontSizeByRatio:(CGFloat)ratio;

#pragma mark - Access Applied Constraint By Attributes From a specific View
/*!
 This method is used to access already applied constraint (means expected constraint) constraint by attribute of a constraints.
 */
- (NSLayoutConstraint*)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute;

/*!
 This method is also used to access already applied constraint (means expected constraint) by attribute of a constraints with completion block.
 */
- (void)accessAppliedConstraintByAttribute:(NSLayoutAttribute)attribute completion:(void (^)(NSLayoutConstraint *appliedConstraint))completion;

/** This method is used to access already applied constraint apply\add constraint between two sibling views. No matter by which sibling View you call this method & no matter order of attributes but you need to call it by one sibling View and pass second other sibling View.
 */
- (NSLayoutConstraint*)accessAppliedConstraintFromSiblingViewByAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView;

#pragma mark - Apply Pin Edges to Superview

/*!
 * Theses method are used to apply\add Left, Right, Top, Bottom, Leading, Trailing, CenterX & CenterY pin constraints in it's superview (means in supreview of receiver (self). )
 
 @param padding padding constraint constant value
 */

/*!
 To Apply\Add left pin constraint to superview of receiver.
 */
- (void)applyLeftPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add right pin constraint to superview of receiver.
 */
- (void)applyRightPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add leading pin constraint to superview of receiver.
 */
- (void)applyLeadingPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add triling pin constraint to superview of receiver.
 */
- (void)applyTrailingPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add top pin constraint to superview of receiver.
 */
- (void)applyTopPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add bottom pin constraint to superview of receiver.
 */
- (void)applyBottomPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add centerX pin constraint to superview of receiver.
 */
- (void)applyCenterXPinConstraintToSuperview:(CGFloat)padding;

/*!
 To Apply\Add centerY pin constraint to superview of receiver.
 */
- (void)applyCenterYPinConstraintToSuperview:(CGFloat)padding;

/*!
 * This method is used to apply\add same leading & trailing pin constraints to superview.

 @param padding padding constraint constant value
 */
- (void)applyLeadingAndTrailingPinConstraintToSuperview:(CGFloat)padding;

/*!
 * This method is used to apply\add same Top and Bottom pin constraints to superview.
 
 @param padding padding constraint constant value
 */
- (void)applyTopAndBottomPinConstraintToSuperview:(CGFloat)padding;

/*!
 * This method is used to apply\add equal width pin constraints to superview.
 */
- (void)applyEqualWidthPinConstrainToSuperview;

/*!
 * This method is used to apply\add equal height pin constraints to superview.
 */
- (void)applyEqualHeightPinConstrainToSuperview;

/*!
 * This method is used to apply\add equal width pin constraints to superview in %(percentage).
 
 @param ratio ratio constraint multiplier value
 */
- (void)applyEqualHeightRatioPinConstrainToSuperview: (CGFloat)ratio;

/*!
 * This method is used to apply\add equal height pin constraints to superview in %(percentage).
 
 @param ratio ratio constraint multiplier value
 */
- (void)applyEqualWidthRatioPinConstrainToSuperview: (CGFloat)ratio;

/*!
 * This method is used to apply\add CenterX pin constraint to receiver view at a specific X position in it's superview.
 
 @param ratio ratio constraint multiplier value
 @param padding padding constraint constant value
 */

- (void)applyCenterXRatioPinConstrainToSuperview:(CGFloat)ratio padding:(CGFloat)padding;

/*!
 * This method is used to apply\add CenterY pin constraint to center receiver view at a specific Y position in it's superview.
 
 @param ratio ratio constraint multiplier value
 @param padding padding constraint constant value
 */
- (void)applyCenterYRatioPinConstrainToSuperview:(CGFloat)ratio padding:(CGFloat)padding;

/*!
 * This method is used to apply\add CenterX & CenterY pin constraints to fully centered receiver view in it's superview.
 */
- (void)applyConstraintForCenterInSuperview;

/*!
 * This method is used to apply\add CenterY pin constraint to center vertically receiver view in it's superview.
 */
- (void)applyConstraintForVerticallyCenterInSuperview;

/*!
 * This method is used to apply\add CenterX pin constraint to center horizontally receiver view in it's superview.
 */
- (void)applyConstraintForHorizontallyCenterInSuperview;

/*!
 * This method is used to apply\add top, bottom, leading & trailing pin constraints to fully cover it's superview.
 */
- (void)applyConstraintFitToSuperview;

/*!
 * This method is used to apply\add leading & trailing pin constraints to fully cover it's superview horizontally.
 */
- (void)applyConstraintFitToSuperviewHorizontally;

/*!
 * This method is used to apply\add top & bottom pin constraints to fully cover it's superview vertically.
 */
- (void)applyConstraintFitToSuperviewVertically;

/*!
 * This method is used to apply\add top, left, bottom & right pin constraints to cover it's superview according to edge insets.
 
 * to exclude any pin constraint between (top, left, bottom & right) then set Inset Edge INFINITY/HUGE_VALF.
 * For Ex. we want to exclude then we must set left Edge of insets either INFINITY or HUGE_VALF.
 * [self applyConstraintFitToSuperviewContentInset:UIEdgeInsetsMake(0, INFINITY, 0, 0)];
 
 @param insets edge insets
 */
- (void)applyConstraintFitToSuperviewContentInset:(UIEdgeInsets)Insets;

#pragma mark - Apply self view constraints

/*!
 To Apply\Add aspect ratio constraint in receiver view.
 */
- (void)applyAspectRatioConstraint;

/*!
  To Apply\Add width constraint in receiver view.
 
 @param width width constraint constant value
 */
- (void)applyWidthConstraint:(CGFloat)width;

/*!
 To Apply\Add height constraint in receiver view.
 
 @param height height constraint constant value
 */

- (void)applyHeightConstraint:(CGFloat) height;

/*!
 To Apply\Add width and height constraints in receiver view.
 
 @param size GGSize struct width and height values
 */
- (void)applySizeConstraint:(CGSize)size;

#pragma mark - Apply Constraint between sibling views
/*!
 This method is used to apply\add constraint between sibling views.
 */
- (void)applyConstraintFromSiblingViewAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(UIView *)otherSiblingView spacing:(CGFloat)spacing;

@end
