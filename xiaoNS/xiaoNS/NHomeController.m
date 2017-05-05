//
//  NHomeController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/27.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NHomeController.h"

@interface NHomeController ()<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// 应用信息
@property (strong, nonatomic) NSArray *icons;

@end

@implementation NHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"首页";
    self.scrollView.backgroundColor = [UIColor grayColor];
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    [self setFirstTools];



}

- (void) setFirstTools {
    // 0.总列数(一行最多3列)
    int totalColumns = 3;
    
    // 1.应用的尺寸
    CGFloat appW = 85;
    CGFloat appH = 90;
    CGFloat contentH = 0;
    // 2.间隙 = (控制器view的宽度 - 3 * 应用宽度) / 4
    CGFloat marginX = (self.scrollView.frame.size.width - totalColumns * appW) / (totalColumns + 1);
    CGFloat marginY = 15;
    
    // 3.根据应用个数创建对应的框框(index 0 ~ 11)
    for (int index = 0; index < 6; index++) {
        // 3.1.创建view
        UIView *view = [[UIView alloc] init];
        
        view.backgroundColor = [UIColor redColor];
        
        // 3.2.添加view
        [self.scrollView addSubview:view];
        
        // 3.3.设置frame
        int row = index / totalColumns;
        int col = index % totalColumns;
        // 计算x和y
        CGFloat appX = marginX + col * (appW + marginX);
        CGFloat appY = 30 + row * (appH + marginY);
        view.frame = CGRectMake(appX, appY, appW, appH);
        
        contentH = view.frame.origin.y + appH + marginY;
    }
    
    self.scrollView.contentSize = CGSizeMake(0, contentH);
}

//- (void)initFirstView {
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(100, 100);
//    flowLayout.minimumLineSpacing = 10;
//    flowLayout.minimumInteritemSpacing = 20;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    
//    CGRect rect = {0, 0, self.view.frame.size.width, self.view.frame.size.height};
//    
//    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
//    [self.scrollView addSubview:collection];
//}

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
