//
//  UIButton+WHBlock.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/11/15.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WHTouchedButtonBlock)(UIButton *sender);

@interface UIButton (WHBlock)

- (void)wh_addActionHandler:(WHTouchedButtonBlock)touchHandler;
@end
