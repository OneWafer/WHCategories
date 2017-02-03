//
//  WHMacros.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 2017/1/4.
//  Copyright © 2017年 王卫华. All rights reserved.
//

#ifndef WHMacros_h
#define WHMacros_h


/** 一些缩写 */
#define wh_keyWindow            [UIApplication sharedApplication].keyWindow
#define wh_AppDelegate          [UIApplication sharedApplication].delegate
#define wh_UserDefaults         [NSUserDefaults standardUserDefaults]
#define wh_NotificationCenter   [NSNotificationCenter defaultCenter]

#define wh_appVersion           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] // app版本号
#define kSystemVersion          [[UIDevice currentDevice] systemVersion] // 系统版本号


/** 屏幕尺寸 */
#define wh_screenWidth   [UIScreen mainScreen].bounds.size.width
#define wh_screenHeight  [UIScreen mainScreen].bounds.size.height


/** 颜色 */
#define wh_clearColor     [UIColor clearColor]

#define wh_RGB(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define wh_RGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

#define wh_randomColor    wh_RGB(arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0)

#define wh_colorWithHex(rgbValue,a) [UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : a]


/** 弱引用/强引用 */
#define wh_weakSelf(type)     __weak typeof(type) weak##type = type
#define wh_strongSelf(type)   __strong typeof(type) type = weak##type

/** 由角度转换弧度/由弧度转换角度 */
#define wh_degreesToRadian(x)       (M_PI * (x) / 180.0)
#define wh_radianToDegrees(radian)  (radian * 180.0) / (M_PI)

/** 定义UIImage对象 */
#define wh_imageNamed(imageName) [UIImage imageNamed:imageName]

/** 字符串拼接 */
#define wh_appendingStr(__str1__,__str2__) [NSString stringWithFormat:@"%@%@",__str1__,__str2__]

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


/** 存储对象 */
#define wh_UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/** 获取存储对象 */
#define wh_UserDefaultGetObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/** 删除对象 */
#define wh_UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#endif /* WHMacros_h */
