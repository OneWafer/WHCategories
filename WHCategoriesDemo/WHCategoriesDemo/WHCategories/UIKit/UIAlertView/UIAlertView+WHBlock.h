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

+ (void)wh_alertWithCallBackBlock:(WHUIAlertViewCallBackBlock)alertWithCallBackBlock
                            title:(NSString *)title
                          message:(NSString *)message
                 cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;

@end
