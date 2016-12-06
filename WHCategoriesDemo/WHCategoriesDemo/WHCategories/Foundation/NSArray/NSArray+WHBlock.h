//
//  NSArray+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/1.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WHBlock)

/** 串行遍历数组中所有元素 */
- (void)wh_each:(void (^)(id obj))block;

/** 并发遍历容器中所有元素(不要求顺序时使用,提高遍历速度) */
- (void)wh_apply:(void (^)(id obj))block;

/** 数组遍历 obj:元素 idx:索引 */
- (void)wh_eachWithIndex:(void (^)(id obj, NSUInteger idx))block;

/** 返回第一个符合block条件（让block返回YES）的元素 */
- (nullable id)wh_match:(BOOL (^)(id obj))block;

/** 筛选所有符合block条件（让block返回YES）的元素,返回重新生成的数组 */
- (NSArray *)wh_select:(BOOL (^)(id object))block;

/** 剔除所有不符合block条件（让block返回YES）的元素,返回重新生成的数组 */
- (NSArray *)wh_reject:(BOOL (^)(id object))block;

/** 返回元素的block映射数组 */
- (NSArray *)wh_map:(id (^)(id obj))block;

@end
