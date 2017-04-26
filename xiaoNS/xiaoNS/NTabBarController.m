//
//  NTabBarController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NTabBarController.h"
#import "NNavHomeController.h"
#import "NNavWorkController.h"
#import "NNavRepairController.h"
#import "NNavManageController.h"

@interface NTabBarController ()

@end

@implementation NTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addAllViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addAllViewController {
    
    NNavHomeController *navHome = [[NNavHomeController alloc] init];
    navHome.tabBarItem.title = @"首页";
    NNavWorkController *navWork = [[NNavWorkController alloc] init];
    navWork.tabBarItem.title = @"工程";
    NNavRepairController *navRepair = [[NNavRepairController alloc] init];
    navRepair.tabBarItem.title = @"维修";
    NNavManageController *navManage = [[NNavManageController alloc] init];
    navManage.tabBarItem.title = @"管护";
    
    
    self.viewControllers = @[navHome, navWork, navRepair, navManage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
