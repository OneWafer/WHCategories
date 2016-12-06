//
//  UIAlertView+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/11/15.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WHUIAlertViewCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (WHBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) WHUIAlertViewCallBackBlock wh_alertViewCallBackBlock;

/**
 @param title 标题文字
 @param message 信息文字
 @param cancelButtonTitle 取消按钮文字
 @param otherButtonTitles 其他按钮(数组)
 @param alertWithCallBackBlock 执行方法Block
 */
+ (void)wh_alertWithTitle:(NSString *)title
                  message:(NSString *)message
        cancelButtonTitle:(NSString *)cancelButtonTitle
        otherButtonTitles:(NSArray *)otherButtonTitles
            CallBackBlock:(WHUIAlertViewCallBackBlock)alertWithCallBackBlock;

@end
