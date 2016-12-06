//
//  NSMutableArray+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (WHBlock)

/** 删除数组中不符合block条件的元素，即只保留符合block条件的元素 */
- (void)wh_performSelect:(BOOL (^)(id obj))block;

/** 删除数组中符合block条件的元素 */
- (void)wh_performReject:(BOOL (^)(id obj))block;

/** 数组中的元素变换为自己的block映射元素 */
- (void)wh_performMap:(id (^)(id obj))block;

@end
