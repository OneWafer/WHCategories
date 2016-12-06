//
//  NSMutableDictionary+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSMutableDictionary+WHBlock.h"

@implementation NSMutableDictionary (WHBlock)

- (void)wh_performSelect:(BOOL (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    NSArray *keys = [[self keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id key, id obj, BOOL *stop) {
        return !block(key, obj);
    }] allObjects];
    
    [self removeObjectsForKeys:keys];
}

- (void)wh_performReject:(BOOL (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    [self wh_performSelect:^BOOL(id key, id obj) {
        return !block(key, obj);
    }];
}

- (void)wh_performMap:(id (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    NSMutableDictionary *new = [self mutableCopy];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id value = block(key, obj) ?: [NSNull null];
        if ([value isEqual:obj]) return;
        new[key] = value;
    }];
    
    [self setDictionary:new];
}

@end
