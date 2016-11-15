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

/**
 
 下面是 <stdarg.h> 里面重要的几个宏定义如下：
 typedef char* va_list;
 void va_start ( va_list ap, prev_param ); // ANSI version
 type va_arg ( va_list ap, type );
 void va_end ( va_list ap );
 va_list 是一个字符指针，可以理解为指向当前参数的一个指针，取参必须通过这个指针进行。
 <Step 1> 在调用参数表之前，定义一个 va_list 类型的变量，(假设va_list 类型变量被定义为ap)；
 <Step 2> 然后应该对ap 进行初始化，让它指向可变参数表里面的第一个参数，这是通过 va_start 来实现的，第一个参数是 ap 本身，第二个参数是在变参表前面紧挨着的一个变量,即“...”之前的那个参数；
 <Step 3> 然后是获取参数，调用va_arg，它的第一个参数是ap，第二个参数是要获取的参数的指定类型，然后返回这个指定类型的值，并且把 ap 的位置指向变参表的下一个变量位置；
 <Step 4> 获取所有的参数之后，我们有必要将这个 ap 指针关掉，以免发生危险，方法是调用 va_end，他是输入的参数 ap 置为 NULL，应该养成获取完参数表之后关闭指针的习惯。说白了，就是让我们的程序具有健壮性。通常va_start和va_end是成对出现。
 
 */

+ (void)wh_alertWithCallBackBlock:(WHUIAlertViewCallBackBlock)alertWithCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles:otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString *))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);
    }
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
    if (self.wh_alertViewCallBackBlock) {
        self.wh_alertViewCallBackBlock(buttonIndex);
    }
}
@end
