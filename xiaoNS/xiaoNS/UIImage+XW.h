//
//  UIImage+XW.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/10.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XW)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
