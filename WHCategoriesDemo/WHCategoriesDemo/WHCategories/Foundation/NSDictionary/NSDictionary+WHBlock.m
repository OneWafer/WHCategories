//
//  NSDictionary+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/6.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "NSDictionary+WHBlock.h"

@implementation NSDictionary (WHBlock)

- (void)wh_each:(void (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (void)wh_apply:(void (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (id)wh_match:(BOOL (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    return self[[[self keysOfEntriesPassingTest:^(id key, id obj, BOOL *stop) {
        if (block(key, obj)) {
            *stop = YES;
            return YES;
        }
        
        return NO;
    }] anyObject]];
}

- (NSDictionary *)wh_select:(BOOL (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    NSArray *keys = [[self keysOfEntriesPassingTest:^(id key, id obj, BOOL *stop) {
        return block(key, obj);
    }] allObjects];
    
    NSArray *objects = [self objectsForKeys:keys notFoundMarker:[NSNull null]];
    return [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}

- (NSDictionary *)wh_reject:(BOOL (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    return [self wh_select:^BOOL(id key, id obj) {
        return !block(key, obj);
    }];
}

- (NSDictionary *)wh_map:(id (^)(id key, id obj))block
{
    NSParameterAssert(block != nil);
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    [self wh_each:^(id key, id obj) {
        id value = block(key, obj) ?: [NSNull null];
        result[key] = value;
    }];
    
    return result;
}


@end
