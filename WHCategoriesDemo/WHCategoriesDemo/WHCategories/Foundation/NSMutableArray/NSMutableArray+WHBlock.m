//
//  NSMutableArray+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSMutableArray+WHBlock.h"

@implementation NSMutableArray (WHBlock)

- (void)wh_performSelect:(BOOL (^)(id obj))block {
    NSParameterAssert(block != nil);
    
    NSIndexSet *list = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return !block(obj);
    }];
    
    if (!list.count) return;
    [self removeObjectsAtIndexes:list];
}

- (void)wh_performReject:(BOOL (^)(id obj))block {
    NSParameterAssert(block != nil);
    return [self wh_performSelect:^BOOL(id obj) {
        return !block(obj);
    }];
}

- (void)wh_performMap:(id (^)(id obj))block {
    NSParameterAssert(block != nil);
    
    NSMutableArray *new = [self mutableCopy];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        if ([value isEqual:obj]) return;
        new[idx] = value;
    }];
    
    [self setArray:new];
}

@end
