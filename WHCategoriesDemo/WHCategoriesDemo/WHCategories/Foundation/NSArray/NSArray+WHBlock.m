//
//  NSArray+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/1.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSArray+WHBlock.h"

@implementation NSArray (WHBlock)

- (void)wh_each:(void (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)wh_apply:(void (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)wh_eachWithIndex:(void (^)(id obj, NSUInteger idx))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (id)wh_match:(BOOL (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    NSUInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];
    
    if (index == NSNotFound)
        return nil;
    
    return self[index];
}

- (NSArray *)wh_select:(BOOL (^)(id object))block
{
    NSParameterAssert(block != nil);
    
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}

- (NSArray *)wh_reject:(BOOL (^)(id object))block
{
    NSParameterAssert(block != nil);
    
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return !block(evaluatedObject);
    }]];
}

- (NSArray *)wh_map:(id (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    NSMutableArray *result = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        [result addObject:value];
    }];
    
    return result;
}


@end
