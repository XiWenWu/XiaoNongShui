//
//  NBaseInfoController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NBaseInfoController.h"
#import "NSubWorkController.h"

#import "subBaseInfo.h"
// 行高
#define rowHeight 44
// 间距
#define rowMargin 10

@interface NBaseInfoController ()

@property (nonatomic, strong) NSArray *subProjects;

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, assign) CGFloat scrollViewH;

@property (nonatomic, assign) CGFloat totggle;

@end

@implementation NBaseInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.totggle = 1;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@", self.project);
    [self setSubProjects];
    [self addScrollView];
    [self addSubViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setSubProjects {
//    NSMutableArray *subProjectsArray = [NSMutableArray array];
//    subBaseInfo *info = [subBaseInfo arrayWithDict:self.project];
//    [subProjectsArray addObject:info];
//    self.subProjects = subProjectsArray;
    NSMutableArray *array = [subBaseInfo arrayWithDict:self.project];
    self.subProjects = array;
}

- (void)addScrollView {
    CGFloat tabH = self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y;
    CGFloat scrollViewW = self.view.frame.size.width;
    CGFloat scrollViewH = self.view.frame.size.height;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    // 显示器高度 减去 导航栏高度  减去  界面切换高度
    scrollView.frame = CGRectMake(0, 0, scrollViewW, scrollViewH - tabH - tabMsgViewH);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // self.scrollView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:scrollView];
    
}

- (void)addSubViews {
    NSLog(@"%lu", self.subProjects.count);
    CGFloat imageViewW = self.view.frame.size.width;
    CGFloat imageViewH = rowHeight;
    CGFloat imageViewX = 0;
    
    CGFloat titleLabelW = self.view.frame.size.width/2 - rowMargin;
    CGFloat titleLabelH = imageViewH;
    CGFloat titleLabelX = rowMargin;
    CGFloat titleLabelY = 0;
    
    CGFloat msgLabelX = titleLabelW;
    CGFloat msgLabelY = 0;
    CGFloat msgLabelW = self.view.frame.size.width - titleLabelW;
    CGFloat msgLabelH = imageViewH;
    
    NSInteger count = 0;
    if (self.totggle == 0) {
        count = self.subProjects.count;
    } else {
        count = 5;
    }
    
    for (int i=0; i< count; i++ ) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageViewY = imageViewH * i;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        [self.scrollView addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
        titleLabel.text = self.subProjects[i][@"title"];
        [imageView addSubview:titleLabel];
        
        UILabel *msgLabel = [[UILabel alloc] init];
        msgLabel.frame = CGRectMake(msgLabelX, msgLabelY, msgLabelW, msgLabelH);
        msgLabel.text = self.subProjects[i][@"msg"] ? self.subProjects[i][@"msg"] : @"空";
        [imageView addSubview:msgLabel];
        
    }
    
    CGFloat tabBtnX = 0;
    CGFloat tabBtnY = rowHeight * count;
    CGFloat tabBtnW = imageViewW;
    CGFloat tabBtnH = rowHeight;
    UIButton *tabBtn = [[UIButton alloc] init];
    tabBtn.frame = CGRectMake(tabBtnX, tabBtnY, tabBtnW, tabBtnH);
    tabBtn.backgroundColor = [UIColor redColor];
    if (self.totggle == 0) {
        [tabBtn setTitle:@"收起" forState:UIControlStateNormal];
    } else {
        [tabBtn setTitle:@"更多" forState:UIControlStateNormal];
    }
    [self.scrollView addSubview:tabBtn];
    
    self.scrollView.contentSize = CGSizeMake(0, (count + 1) * rowHeight);
    
    [tabBtn addTarget:self action:@selector(toggleInfoView) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)toggleInfoView {
    NSLog(@"toggleInfoView");
    if (self.totggle == 0) {
        self.totggle = 1;
    } else {
        self.totggle = 0;
    }
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addSubViews];
    
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
