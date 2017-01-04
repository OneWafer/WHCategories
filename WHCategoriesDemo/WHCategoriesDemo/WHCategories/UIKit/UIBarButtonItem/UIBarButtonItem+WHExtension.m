//
//  UIBarButtonItem+WHExtension.m
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/7.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "UIBarButtonItem+WHExtension.h"
#import "UIButton+WHBlock.h"

@implementation UIBarButtonItem (WHExtension)

/** 图标UIBarButtonItem */
+ (instancetype)wh_itemWithType:(WHItemType)type norImage:(NSString *)norImage highImage:(NSString *)highImage offset:(CGFloat)offset actionHandler:(WHTouchedBarButtonItemBlock)touchHandler
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.imageEdgeInsets = type == WHItemTypeLeft ? UIEdgeInsetsMake(0, -offset, 0, 0) : UIEdgeInsetsMake(0, 0, 0, -offset);
    [btn sizeToFit];
    // 添加按钮点击事件
    [btn wh_addActionHandler:^(UIButton *sender) {
        if (touchHandler) touchHandler(sender);
    }];
    UIView *containVew = [[UIView alloc] initWithFrame:btn.bounds];
    [containVew addSubview:btn];
    return [[self alloc] initWithCustomView:containVew];
}

/** 文字UIBarButtonItem */
+ (instancetype)wh_itemWithType:(WHItemType)type norTitle:(NSString *)norTitle font:(CGFloat)font norColor:(UIColor *)norColor highColor:(UIColor *)highColor offset:(CGFloat)offset actionHandler:(WHTouchedBarButtonItemBlock)touchHandler
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:norTitle forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setTitleColor:norColor forState:UIControlStateNormal];
    [btn setTitleColor:highColor forState:UIControlStateHighlighted];
    btn.titleEdgeInsets = type == WHItemTypeLeft ? UIEdgeInsetsMake(0, -offset, 0, 0) : UIEdgeInsetsMake(0, 0, 0, -offset);
    [btn sizeToFit];
    // 添加按钮点击事件
    [btn wh_addActionHandler:^(UIButton *sender) {
        if (touchHandler) touchHandler(sender);
    }];
    UIView *containVew = [[UIView alloc] initWithFrame:btn.bounds];
    [containVew addSubview:btn];
    return [[self alloc] initWithCustomView:containVew];
}

@end
