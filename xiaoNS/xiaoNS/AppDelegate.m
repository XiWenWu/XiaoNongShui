//
//  AppDelegate.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "AppDelegate.h"
#import "NLoginController.h"
#import "NNavHomeController.h"
#import "NHomeController.h"
#import "LeftSortsViewController.h"
#import "NTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 2017-05-16 增加左侧滑动  注释登录
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyWindow];
    self.window.rootViewController = [[NLoginController alloc] init];

    return YES;
}
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    
    // 把主界面 MainPageViewController 添加到 导航栏控制器 UINavigationController 中
    self.mainTabBarController = [[NTabBarController alloc] init];
    // 左侧菜单
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
    self.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainTabBarController];
    // [UIApplication sharedApplication].keyWindow.rootViewController = [[NTabBarController alloc] init];
    
    //self.window.rootViewController = self.LeftSlideVC;
    self.window.rootViewController = [[NLoginController alloc] init];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
