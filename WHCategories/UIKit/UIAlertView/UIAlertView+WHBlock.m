//
//  UIAlertView+WHBlock.m
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/11/15.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <objc/runtime.h>
#import "UIAlertView+WHBlock.h"

static const void *wh_UIAlertViewKey = &wh_UIAlertViewKey;

@implementation UIAlertView (WHBlock)


+ (void)wh_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles CallBackBlock:(WHUIAlertViewCallBackBlock)alertWithCallBackBlock
{
    if (!cancelButtonTitle.length && !otherButtonTitles.count)
        cancelButtonTitle = NSLocalizedString(@"取消", nil);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger idx, BOOL *stop) {
        [alert addButtonWithTitle:button];
    }];
    
    alert.delegate = alert;
    [alert show];
    alert.wh_alertViewCallBackBlock = alertWithCallBackBlock;
}


- (void)setWh_alertViewCallBackBlock:(WHUIAlertViewCallBackBlock)alertViewCallBackBlock
{
    objc_setAssociatedObject(self, wh_UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
}

- (WHUIAlertViewCallBackBlock)wh_alertViewCallBackBlock
{
    return objc_getAssociatedObject(self, wh_UIAlertViewKey);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.wh_alertViewCallBackBlock) self.wh_alertViewCallBackBlock(buttonIndex);
}
@end
