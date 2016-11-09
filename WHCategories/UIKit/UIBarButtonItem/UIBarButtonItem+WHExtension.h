//
//  UIBarButtonItem+WHExtension.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/7.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WHItemType) {
    WHItemTypeLeft = 0,                // 左边的按钮
    WHItemTypeRight = 1,               // 右边的按钮
};

@interface UIBarButtonItem (WHExtension)

/**
 图标UIBarButtonItem
 
 @param type      左侧or右侧按钮
 @param norImage  按钮图标
 @param highImage 按钮高亮图标
 @param target    目标
 @param action    点击事件
 @param offset    图标偏移量
 
 */
+ (instancetype)wh_itemWithType:(WHItemType)type norImage:(NSString *)norImage highImage:(NSString *)highImage target:(id)target action:(SEL)action offset:(CGFloat)offset;



/**
 文字UIBarButtonItem
 
 @param type      左侧or右侧按钮
 @param norTitle  按钮文字
 @param font      按钮文字字体
 @param norColor  按钮字体颜色
 @param highColor 按钮字体高亮颜色
 @param target    目标
 @param action    点击事件
 @param offset    文字偏移量
 
 */
+ (instancetype)wh_itemWithType:(WHItemType)type norTitle:(NSString *)norTitle font:(CGFloat)font norColor:(UIColor *)norColor highColor:(UIColor *)highColor target:(id)target action:(SEL)action offset:(CGFloat)offset;

@end
