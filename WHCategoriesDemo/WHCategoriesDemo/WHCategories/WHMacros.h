//
//  WHMacros.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 2017/1/4.
//  Copyright © 2017年 王卫华. All rights reserved.
//

#ifndef WHMacros_h
#define WHMacros_h

/** 屏幕宽度 */
#define wh_screenWidth [UIScreen mainScreen].bounds.size.width

/** 屏幕高度 */
#define wh_screenHeight [UIScreen mainScreen].bounds.size.height

/** 生成颜色值 */
#define wh_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

/** 生成颜色值 可以设置透明度 */
#define wh_RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

/** 随机颜色值 */
#define wh_randomColor wh_RGB(arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0)

/** 十六进制颜色值 可设置透明度 */
#define wh_colorWithHex(rgbValue,a) [UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : a]

/** 弱引用 */
#define wh_weakSelf(type) __weak typeof(type) weak##type = type;

/** 强引用 */
#define wh_strongSelf(type)  __strong typeof(type) type = weak##type;

/** 由角度转换弧度 */
#define wh_degreesToRadian(x) (M_PI * (x) / 180.0)

/** 由弧度转换角度 */
#define wh_radianToDegrees(radian) (radian * 180.0) / (M_PI)

/** 定义UIImage对象 */
#define wh_mageNamed(imageName) [UIImage imageNamed:imageName]

/** 打印输出 */
#if DEBUG
#define wh_Log(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define wh_Log(FORMAT, ...) nil
#endif

/** 设置控件的圆角和边框 */
#define wh_viewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]



#endif /* WHMacros_h */
