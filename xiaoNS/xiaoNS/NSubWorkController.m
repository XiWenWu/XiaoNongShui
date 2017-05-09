//
//  NSubWorkController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NSubWorkController.h"
#import "NBaseInfoController.h"
#import "NPictureController.h"
#import "NRepairRecordController.h"
#import "NManageRecordController.h"

#import "AFHTTPSessionManager.h"

@interface NSubWorkController ()

@property (nonatomic, strong) NSArray *subWorkInfos;

@end

static CGFloat const labelH = 44;

@implementation NSubWorkController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubWorkInfos];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"详情";
    // 获取导航的尺寸
    CGRect navFrame = self.navigationController.navigationBar.frame;
    // 计算UIScrollView控件位置
    CGFloat SHy = navFrame.origin.y + navFrame.size.height;
    CGFloat SHw = self.view.frame.size.width;
    CGFloat SHh = labelH;
    UIView *hView = [[UIView alloc] initWithFrame:CGRectMake(0, SHy, SHw, SHh)];
    hView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:hView];
    // 添加分页控制器
    [self setUpChildViewController];
    //
    [self setUpTitleLabel:hView];
}

- (void)setSubWorkInfos {
    // 网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    [manager GET:self.subWorkUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
//        NSArray *dictArray = responseObject[@"ret"];
//        
//        NSMutableArray *manageArray = [NSMutableArray array];
//        
//        for (NSDictionary *dict in dictArray) {
//            ManageInfo *manage = [ManageInfo manageWithDict:dict];
//            [manageArray addObject:manage];
//        }
//        self.manages = manageArray;
//        
//        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败");
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpChildViewController {
    NBaseInfoController *baseInfo = [[NBaseInfoController alloc] init];
    baseInfo.title = @"基础信息";
    [self addChildViewController:baseInfo];
    
    NPictureController *picture = [[NPictureController alloc] init];
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    NRepairRecordController *repairRecord = [[NRepairRecordController alloc] init];
    repairRecord.title = @"维修记录";
    [self addChildViewController:repairRecord];
    
    NManageRecordController *manageRecord = [[NManageRecordController alloc] init];
    manageRecord.title = @"管护记录";
    [self addChildViewController:manageRecord];
}

//
- (void)setUpTitleLabel:(UIView *)UIView {
    NSInteger chlidCount = self.childViewControllers.count;
    CGFloat viewW = self.view.frame.size.width;
    
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelW = viewW / 4;
    CGFloat labelH = 44;
    
    for (int i = 0; i < chlidCount; i++) {
        UIViewController *vc = self.childViewControllers[i];
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(labelW * i + labelX, labelY, labelW, labelH);
        label.text = vc.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.tag = i;
        label.backgroundColor = [UIColor redColor];
        // 添加按钮手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [label addGestureRecognizer:tap];
        
        label.userInteractionEnabled = YES;
        
        if (i==0) {
            [self titleClick:tap];
        }
        [UIView addSubview:label];
    }
}

- (void)titleClick:(UITapGestureRecognizer *)tap {
    NSLog(@"%ld", tap.view.tag);
    NSInteger count = tap.view.tag;
    UIViewController *vc = self.childViewControllers[count];
    // 整个导航栏的高度是导航条的Y值加上单行的高度
    CGFloat barH = self.navigationController.navigationBar.frame.size.height;
    CGFloat barY = self.navigationController.navigationBar.frame.origin.y;
    
    vc.view.frame = CGRectMake(0, barH + barY + labelH, self.view.frame.size.width, self.view.frame.size.height - barH - barY - labelH );
    
    [self.view addSubview:vc.view];
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
