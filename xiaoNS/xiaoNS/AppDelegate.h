//
//  AppDelegate.h
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "NTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) NTabBarController *mainTabBarController;


@end

