//
//  UIButton+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/11/15.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+WHBlock.h"

static const void *wh_UIButtonBlockKey = &wh_UIButtonBlockKey;

@implementation UIButton (WHBlock)

- (void)wh_addActionHandler:(WHTouchedButtonBlock)touchHandler
{
    objc_setAssociatedObject(self, wh_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(wh_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)wh_blockActionTouched:(UIButton *)sender
{
    WHTouchedButtonBlock block = objc_getAssociatedObject(self, wh_UIButtonBlockKey);
    if (block) block(sender);
}

@end
