//
//  UIView+WHFrame.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WHFrame)

@property (nonatomic, assign) CGPoint wh_origin;
@property (nonatomic, assign) CGSize wh_size;

@property (nonatomic, assign) CGFloat wh_width;
@property (nonatomic, assign) CGFloat wh_height;

@property (nonatomic, assign) CGFloat wh_centerX;
@property (nonatomic, assign) CGFloat wh_centerY;


@property (nonatomic, assign) CGFloat wh_top;
@property (nonatomic, assign) CGFloat wh_left;
@property (nonatomic, assign) CGFloat wh_bottom;
@property (nonatomic, assign) CGFloat wh_right;


@end
