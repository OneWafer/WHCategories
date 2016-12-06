//
//  NSDictionary+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WHBlock)

/** 串行遍历字典中所有元素 */
- (void)wh_each:(void (^)(id key, id obj))block;

/** 并发遍历字典中所有元素 */
- (void)wh_apply:(void (^)(id key, id obj))block;

/** 返回第一个符合block条件（让block返回YES）的元素 */
- (nullable id)wh_match:(BOOL (^)(id key, id obj))block;

/** 筛选所有符合block条件（让block返回YES）的元素,返回重新生成的字典 */
- (NSDictionary *)wh_select:(BOOL (^)(id key, id obj))block;

/** 剔除所有不符合block条件（让block返回YES）的元素,返回重新生成的字典 */
- (NSDictionary *)wh_reject:(BOOL (^)(id key, id obj))block;

/** 返回元素的block映射字典 */
- (NSDictionary *)wh_map:(id (^)(id key, id obj))block;


@end
