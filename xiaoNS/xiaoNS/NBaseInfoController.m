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

@end

@implementation NBaseInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    scrollView.contentSize = CGSizeMake(0, self.subProjects.count * rowHeight);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // self.scrollView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:scrollView];
    
}

- (void)addSubViews {
    NSLog(@"%ld", self.subProjects.count);
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
    
    for (int i=0; i< self.subProjects.count; i++ ) {
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
