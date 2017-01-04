//
//  UITextField+WHPlaceholder.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 17/1/4.
//  Copyright © 2017年 王卫华. All rights reserved.
//

#import "UITextField+WHPlaceholder.h"

static NSString * const WHPlaceholderColorKeyPath = @"_placeholderLabel.textColor";
static NSString * const WHPlaceholderFontKeyPath = @"_placeholderLabel.font";

@implementation UITextField (WHPlaceholder)

/** 获取占位文字颜色 */
- (UIColor *)wh_placeholderColor
{
    return [self valueForKeyPath:WHPlaceholderColorKeyPath];
}

/** 设置占位文字颜色 */
- (void)setWh_placeholderColor:(UIColor *)wh_placeholderColor
{
    self.placeholder = self.placeholder ?: @" ";
    wh_placeholderColor = wh_placeholderColor ?: [UIColor colorWithRed:0.0 green:0.0 blue:0.0980392 alpha:0.22];
    [self setValue:wh_placeholderColor forKeyPath:WHPlaceholderColorKeyPath];
}

/** 获取占位文字字体 */
- (UIFont *)wh_placeholderFont
{
    return [self valueForKeyPath:WHPlaceholderFontKeyPath];
}

/** 设置占位文字字体 */
- (void)setWh_placeholderFont:(UIFont *)wh_placeholderFont
{
    self.placeholder = self.placeholder ?: @" ";
    wh_placeholderFont = wh_placeholderFont ?: [UIFont systemFontOfSize:17];
    [self setValue:wh_placeholderFont forKeyPath:WHPlaceholderFontKeyPath];
}

@end
