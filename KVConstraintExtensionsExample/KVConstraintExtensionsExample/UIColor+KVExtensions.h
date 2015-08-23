//
//  UIColor+KV_Addition.h
//  KV_LayoutDemo
//
//  Created by Welcome on 08/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

@interface UIColor (KVExtensions)

+ (UIColor *)flatRedColor;
+ (UIColor *)flatDarkRedColor;

+ (UIColor *)Red;        
+ (UIColor *)Pink;
+ (UIColor *)Purple;
+ (UIColor *)DeepPurple;
+ (UIColor *)Blue;
+ (UIColor *)LightBlue;
+ (UIColor *)Cyan;
+ (UIColor *)Indigo;     
+ (UIColor *)Teal;       
+ (UIColor *)Green;      
+ (UIColor *)LightGreen; 
+ (UIColor *)Lime;
+ (UIColor *)Yellow;     
+ (UIColor *)Amber;
+ (UIColor *)DeepAmber; 
+ (UIColor *)Orange;
+ (UIColor *)DeepOrange; 
+ (UIColor *)Brown;
+ (UIColor *)Grey;
+ (UIColor *)BlueGrey;

@end
