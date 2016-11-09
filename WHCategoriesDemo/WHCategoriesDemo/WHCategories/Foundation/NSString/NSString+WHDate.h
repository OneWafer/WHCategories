//
//  NSString+WHDate.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/9.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WHDate)


/**
 根据格式获取当前时间

 @param format 时间格式(如:yyyy-MM-dd)

 */
+ (NSString *)wh_getCurrentTimeWithFormat:(NSString *)format;

/**
 时间戳和格式转成日期字符串

 @param timestamp 时间戳
 @param format    时间格式(如:yyyy-MM-dd)

 */
+ (NSString *)wh_getDateStirngWithTimestamp:(NSString *)timestamp Format:(NSString *)format;


/**
 NSDate转字符串
 
 @param date   日期
 @param format 时间格式(如:yyyy-MM-dd)

 */
+ (NSString *)wh_getDateStringWithDate:(NSDate *)date Format:(NSString *)format;

@end
