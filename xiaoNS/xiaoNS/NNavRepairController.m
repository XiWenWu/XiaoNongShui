//
//  NNavRepairController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NNavRepairController.h"
#import "NRepairController.h"

@interface NNavRepairController ()

@end

@implementation NNavRepairController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NRepairController *repair = [[NRepairController alloc] init];
    
    self.viewControllers = @[repair];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
