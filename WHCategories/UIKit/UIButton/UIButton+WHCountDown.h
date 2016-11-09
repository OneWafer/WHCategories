//
//  UIButton+WHCountDown.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WHCountDown)

-(void)wh_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
