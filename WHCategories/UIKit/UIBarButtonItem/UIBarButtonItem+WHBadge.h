//
//  UIBarButtonItem+WHBadge.h
//  WHCategories-Demo
//
//  Created by 王卫华 on 16/11/7.
//  Copyright © 2016年 王卫华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WHBadge)

@property (nonatomic, strong) UILabel *badge;

/** Badge数值 */
@property (nonatomic, copy) NSString *badgeValue;
/** Badge颜色 */
@property (nonatomic, strong) UIColor *badgeBGColor;
/** 字体颜色 */
@property (nonatomic, strong) UIColor *badgeTextColor;
/** 字体大小 */
@property (nonatomic, strong) UIFont *badgeFont;
/** Badge大小 */
@property (nonatomic, assign) CGFloat badgePadding;
/** 最小尺寸 */
@property (nonatomic, assign) CGFloat badgeMinSize;
/** X轴 */
@property (nonatomic, assign) CGFloat badgeOriginX;
/** Y轴 */
@property (nonatomic, assign) CGFloat badgeOriginY;
/** 当值为0的时候是否隐藏 */
@property (nonatomic, assign) BOOL shouldHideBadgeAtZero;
/** 当值发生变化时是否显示动画 */
@property (nonatomic, assign) BOOL shouldAnimateBadge;


@end
