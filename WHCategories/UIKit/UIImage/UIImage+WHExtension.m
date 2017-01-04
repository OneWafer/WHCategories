//
//  UIImage+WHExtension.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/30.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "UIImage+WHExtension.h"

@implementation UIImage (WHExtension)

/** 根据颜色生成纯色图片 */
+ (UIImage *)wh_imgWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

/** 生成圆形图片 */
- (UIImage *)wh_roundImg
{
    // 开启一个位图上下文(大小跟图片一样大)
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 添加一个裁剪区域,前两个参数是裁剪的中心点,后面两个决定裁剪的区域是圆形还是椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 把路径设置为裁剪区域(超出裁剪区域以外的内容会自动裁剪掉)
    [path addClip];
    // 把图片绘制到上下文当中
    [self drawAtPoint:CGPointZero];
    // 从上下文当中生成一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}

/** 生成带纯色边框的圆形图片 */
- (UIImage *)wh_roundImgWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    CGFloat newImgW = self.size.width + 2 * borderWidth;
    CGFloat newImgH = newImgW;
    CGSize newImgSize = CGSizeMake(newImgW, newImgH);
    // 开启一个和新图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(newImgSize, NO, 0.0);
    // 绘制一个大圆,填充颜色
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, newImgSize.width, newImgSize.height)];
    [borderColor set];
    [path fill];
    // 添加一个裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    [path addClip];
    
    [self drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/** 生成带图片边框的图片 */
- (UIImage *)wh_roundImgWithBorderImg:(NSString *)borderImg borderWidth:(CGFloat)borderWidth
{
    CGFloat newImgW = self.size.width + 2 * borderWidth;
    CGFloat newImgH = newImgW;
    CGSize newImgSize = CGSizeMake(newImgW, newImgH);
    // 开启一个和新图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(newImgSize, NO, 0.0);
    // 绘制一个大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, newImgSize.width, newImgSize.height)];
    [path addClip];
    // 把背景图片绘制到上下文中
    [[UIImage imageNamed:borderImg] drawAtPoint:CGPointZero];
    // 添加一个裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    [path addClip];
    
    [self drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
