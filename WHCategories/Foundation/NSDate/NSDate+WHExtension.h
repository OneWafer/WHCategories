//
//  NSDate+WHExtension.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WHExtension)

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
 
 @param format 时间格式(如:yyyy-MM-dd)
 
 */
- (NSString *)wh_getDateStringWithFormat:(NSString *)format;


/**
 返回day天后的日期(若day为负数,则为|day|天前的日期)

 @param day 指定的天数
 */
- (NSDate *)wh_dateAfterDay:(NSUInteger)day;


/**
 返回指定日期的date

 @param year 指定的年
 @param month 指定的月
 @param day 指定的天
 */
+ (NSDate *)wh_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
@end
