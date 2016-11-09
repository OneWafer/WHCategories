//
//  UIView+WHFrame.m
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/5.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import "UIView+WHFrame.h"

@implementation UIView (WHFrame)

#pragma mark - Shortcuts for the frame

- (CGPoint)wh_origin
{
    return self.frame.origin;
}

- (void)setWh_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGSize)wh_size
{
    return self.frame.size;
}

- (void)setWh_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (CGFloat)wh_width
{
    return self.frame.size.width;
}

- (void)setWh_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)wh_height
{
    return self.frame.size.height;
}

- (void)setWh_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


#pragma mark - Shortcuts for the positions

- (CGFloat)wh_centerX
{
    return self.center.x;
}

- (void)setWh_centerX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)wh_centerY
{
    return self.center.y;
}

- (void)setWh_centerY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}


#pragma mark - Shortcuts for the coords

- (CGFloat)wh_top
{
    return self.frame.origin.y;
}

- (void)setWh_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)wh_left
{
    return self.frame.origin.x;
}

- (void)setWh_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)wh_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setWh_bottom:(CGFloat)wh_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = wh_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)wh_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWh_right:(CGFloat)wh_right
{
    CGRect frame = self.frame;
    frame.origin.x = wh_right - self.frame.size.width;
    self.frame = frame;
}
@end
