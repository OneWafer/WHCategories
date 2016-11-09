//
//  NSString+WHDate.m
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/9.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSString+WHDate.h"

@implementation NSString (WHDate)

/** 根据格式获取当前时间 */
+ (NSString *)wh_getCurrentTimeWithFormat:(NSString *)format
{
    NSDate *currentDate = [NSDate date];// 获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:currentDate];
}

/** 时间戳和格式转成日期字符串 */
+ (NSString *)wh_getDateStirngWithTimestamp:(NSString *)timestamp Format:(NSString *)format
{
    NSTimeInterval interval = timestamp.length == 13 ? [timestamp doubleValue] / 1000.0f : [timestamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate: date];
}

/** NSDate转字符串 */
+ (NSString *)wh_getDateStringWithDate:(NSDate *)date Format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}
@end
