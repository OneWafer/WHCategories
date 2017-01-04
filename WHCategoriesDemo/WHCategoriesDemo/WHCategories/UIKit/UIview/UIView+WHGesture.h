//
//  UIView+WHGesture.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 16/12/1.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^WHGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (WHGesture)

/** 添加单击手势 */
- (void)wh_addTapActionWithBlock:(WHGestureActionBlock)block;

/** 添加长安手势 */
- (void)wh_addLongPressActionWithBlock:(WHGestureActionBlock)block;

@end
