//
//  UIImage+WHExtension.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/30.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WHExtension)

/**
 根据颜色生成纯色图片

 @param color 颜色

 */
+ (UIImage *)wh_imgWithColor:(UIColor *)color;

/** 生成圆形图片 */
- (UIImage *)wh_roundImg;

/**
 生成带纯色边框的圆形图片

 @param borderColor 边框颜色
 @param borderWidth 边框宽度

 */
- (UIImage *)wh_roundImgWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 生成带图片边框的图片

 @param borderImg 边框背景图
 @param borderWidth 边框宽度
 
 */
- (UIImage *)wh_roundImgWithBorderImg:(NSString *)borderImg borderWidth:(CGFloat)borderWidth;

@end
