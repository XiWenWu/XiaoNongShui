
//
//  NNavAddPicController.m
//  xiaoNS
//
//  Created by 希文 on 2017/6/2.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NNavAddPicController.h"
#import "NAddPicController.h"

@interface NNavAddPicController ()

@end

@implementation NNavAddPicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NAddPicController *addPic = [[NAddPicController alloc] init];
    addPic.NAddPicInputID = self.NNavAddPicInputID;
    addPic.NAddPicProindex = self.NNavAddPicProindex;
    addPic.NAddPicUserID = self.NNavAddPicUserID;
    self.viewControllers = @[addPic];
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
