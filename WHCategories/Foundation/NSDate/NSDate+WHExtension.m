//
//  NSDate+WHExtension.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSDate+WHExtension.h"

@implementation NSDate (WHExtension)

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
- (NSString *)wh_getDateStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

/** 返回day天后的日期 */
- (NSDate *)wh_dateAfterDay:(NSUInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return dateAfterDay;
}

/** 返回指定日期的date */
+ (NSDate *)wh_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    [self zeroOutTimeComponents:&components];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [gregorianCalendar dateFromComponents:components];
}

+ (void)zeroOutTimeComponents:(NSDateComponents **)components {
    [*components setHour:0];
    [*components setMinute:0];
    [*components setSecond:0];
}
@end
