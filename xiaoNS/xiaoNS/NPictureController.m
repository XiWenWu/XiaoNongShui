//
//  NPictureController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NPictureController.h"

@interface NPictureController ()

@end

@implementation NPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.imgs);
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