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
    // 第一个组件
    [self initFirstView];

}

- (void)initFirstView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGRect rect = {0, 0, self.view.frame.size.width, self.view.frame.size.height};
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
    [self.scrollView addSubview:collection];
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
