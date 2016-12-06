//
//  NSMutableDictionary+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WHBlock)

/** 删除字典中不符合block条件的元素，即只保留符合block条件的元素 */
- (void)wh_performSelect:(BOOL (^)(id key, id obj))block;

/** 删除字典中符合block条件的元素 */
- (void)wh_performReject:(BOOL (^)(id key, id obj))block;

/** 字典中的元素变换为自己的block映射元素 */
- (void)wh_performMap:(id (^)(id key, id obj))block;

@end
