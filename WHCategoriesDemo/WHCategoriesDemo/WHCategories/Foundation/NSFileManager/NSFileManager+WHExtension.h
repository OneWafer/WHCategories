//
//  NSFileManager+WHExtension.h
//  WHCategoriesDemo
//
//  Created by 王卫华 on 17/1/4.
//  Copyright © 2017年 王卫华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WHCompletionBlock)(NSInteger size);

@interface NSFileManager (WHExtension)

/** 获取document路径 */
+ (NSString *)wh_documentsPath;

/** 获取library路径 */
+ (NSString *)wh_libraryPath;

/** 获取caches路径 */
+ (NSString *)wh_cachesPath;

/**
 计算指定文件夹的大小
 
 @param dirPath 文件夹名
 @param completion 计算完成的回调
 */
+ (void)wh_getFileSize:(NSString *)dirPath completion:(WHCompletionBlock)completion;

/**
 清理指定文件夹
 
 @param dirPath 文件夹名
 */
+ (void)wh_clearDirPath:(NSString *)dirPath;

/** 计算缓存文件夹大小 */
+ (void)wh_getCacheSizeCompletion:(WHCompletionBlock)completion;

/** 清除缓存文件夹 */
+ (void)wh_clearCache;

@end
