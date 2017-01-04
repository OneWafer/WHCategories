//
//  UIView+WHGesture.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/1.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+WHGesture.h"

static const void *wh_TapBlockKey = &wh_TapBlockKey;
static const void *wh_TapGestureKey = &wh_TapGestureKey;
static const void *wh_LongPressBlockKey = &wh_LongPressBlockKey;
static const void *wh_LongPressGestureKey = &wh_LongPressGestureKey;

@implementation UIView (WHGesture)

- (void)wh_addTapActionWithBlock:(WHGestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, wh_TapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, wh_TapGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, wh_TapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        WHGestureActionBlock block = objc_getAssociatedObject(self, wh_TapBlockKey);
        if (block) block(gesture);
    }
}


- (void)wh_addLongPressActionWithBlock:(WHGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, wh_LongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        objc_setAssociatedObject(self, wh_LongPressGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, wh_LongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        WHGestureActionBlock block = objc_getAssociatedObject(self, wh_LongPressBlockKey);
        if (block) block(gesture);
    }
}


@end
