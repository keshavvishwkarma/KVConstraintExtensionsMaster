//
//  UIColor+KV_Addition.m
//  KV_LayoutDemo
//
//  Created by Keshav on 08/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "UIColor+KVExtensions.h"

@implementation UIColor (KVExtensions)

#pragma mark - Red
+ (UIColor *)flatRedColor {
    return UIColorFromRGB(0xE74C3C);
}
+ (UIColor *)flatDarkRedColor {
    return UIColorFromRGB(0xC0392B);
}
+ (UIColor *)Red {
    return UIColorFromRGB(0xF44336);
}
+ (UIColor *)Pink {
    return UIColorFromRGB(0xE91E63);
}
+ (UIColor *)Purple {
    return UIColorFromRGB(0x9C27B0);
}
+ (UIColor *)DeepPurple {
    return UIColorFromRGB(0x67AB7);
}
+ (UIColor *)Indigo {
    return UIColorFromRGB(0x3F51B5);
}
+ (UIColor *)Blue {
    return UIColorFromRGB(0x2196F3);
}
+ (UIColor *)LightBlue {
    return UIColorFromRGB(0x03A9F4);
}
+ (UIColor *)Cyan {
    return UIColorFromRGB(0x00BCD4);
}
+ (UIColor *)Teal {
    return UIColorFromRGB(0x009688);
}
+ (UIColor *)Green {
    return UIColorFromRGB(0x4CAF50);
}
+ (UIColor *)LightGreen {
    return UIColorFromRGB(0x8BC34A);
}
+ (UIColor *)Lime {
    return UIColorFromRGB(0xCDDC39);
}
+ (UIColor *)Yellow {
    return UIColorFromRGB(0xFFEB3B);
}
+ (UIColor *)Amber {
    return UIColorFromRGB(0xFFC107);
}
+ (UIColor *)DeepAmber {
    return [UIColorFromRGB(0xFFC107) colorWithAlphaComponent:0.7];
}
+ (UIColor *)Orange {
    return UIColorFromRGB(0xFF9800);
}
+ (UIColor *)DeepOrange {
    return UIColorFromRGB(0xFF5722);
}
+ (UIColor *)Brown {
    return UIColorFromRGB(0x795548);
}
+ (UIColor *)Grey {
    return UIColorFromRGB(0x9E9E9E);
}
+ (UIColor *)BlueGrey {
    return UIColorFromRGB(0x607D8B);
}

@end
