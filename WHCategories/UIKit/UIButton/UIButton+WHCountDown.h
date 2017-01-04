//
//  UIButton+WHCountDown.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WHCountDown)

/**
 让按钮进入倒计时
 
 @param timeout 倒计时长
 @param tittle 倒计时过程中显示的标题
 @param waitTittle 倒计时完成显示的标题
 */
- (void)wh_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
