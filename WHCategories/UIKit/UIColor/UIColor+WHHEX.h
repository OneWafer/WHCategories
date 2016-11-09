//
//  UIColor+WHHEX.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WHHEX)

+ (UIColor *)wh_colorWithHex:(UInt32)hex;
+ (UIColor *)wh_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)wh_colorWithHexString:(NSString *)hexString;
- (NSString *)wh_HEXString;

+ (UIColor *)wh_colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)wh_colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end
