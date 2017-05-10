//
//  NNavManageController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NNavManageController.h"
#import "NManageController.h"

@interface NNavManageController ()

@end

@implementation NNavManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NManageController *manage = [[NManageController alloc] init];
    
    self.viewControllers = @[manage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
