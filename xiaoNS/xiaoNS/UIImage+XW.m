//
//  UIImage+XW.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/10.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "UIImage+XW.h"

@implementation UIImage (XW)

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

@end
