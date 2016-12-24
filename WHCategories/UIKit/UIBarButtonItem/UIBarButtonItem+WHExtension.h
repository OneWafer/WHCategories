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

typedef void(^WHTouchedBarButtonItemBlock)(UIButton *sender);

@interface UIBarButtonItem (WHExtension)

/**
 图标UIBarButtonItem
 
 @param type         左侧or右侧按钮
 @param norImage     按钮图标
 @param highImage    按钮高亮图标
 @param offset       图标偏移量
 @param touchHandler 点击事件处理
 
 */
+ (instancetype)wh_itemWithType:(WHItemType)type
                       norImage:(NSString *)norImage
                      highImage:(NSString *)highImage
                         offset:(CGFloat)offset
                  actionHandler:(WHTouchedBarButtonItemBlock)touchHandler;




/**
 文字UIBarButtonItem
 
 @param type         左侧or右侧按钮
 @param norTitle     普通状态文字
 @param font         文字字体大小
 @param norColor     普通状态文字颜色
 @param highColor    高亮状态文字颜色
 @param offset       偏移量
 @param touchHandler 点击事件处理
 
 */
+ (instancetype)wh_itemWithType:(WHItemType)type
                       norTitle:(NSString *)norTitle
                           font:(CGFloat)font
                       norColor:(UIColor *)norColor
                      highColor:(UIColor *)highColor
                         offset:(CGFloat)offset
                  actionHandler:(WHTouchedBarButtonItemBlock)touchHandler;

@end
