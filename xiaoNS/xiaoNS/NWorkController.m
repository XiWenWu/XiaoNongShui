//
//  NWorkController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//
// 导入控制器
#import "NWorkController.h"
// 导入工具
#import "AFHTTPSessionManager.h"
// 导入模型
#import "WorksInfo.h"
#import "WorkInfoCell.h"


@interface NWorkController ()
/** 工程信息 */
@property (nonatomic, strong) NSArray *works;

@end

@implementation NWorkController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"工程";
    self.tableView.rowHeight = 130;
    // 通过网络请求获取数据
    [self setUpWorks];
}
/** 通过网络请求获取数据 */
- (void)setUpWorks {
    // 创建请求管理对象
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    // 发送请求
    [manger GET:@"http://www.cloudowr.com:8801/nsgcgl/api/v3/projectList?key=android&userid=1" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject[@"ret"][@"list"]);
        // 获取数据
        NSArray *dictArray = responseObject[@"ret"][@"list"];
        // 将字典数据转为模型数据
        NSMutableArray *workArray = [NSMutableArray array];
        // 遍历，转换
        for (NSDictionary *dict in dictArray) {
            WorksInfo *work = [WorksInfo workWithDict:dict];
            // 添加模型
            [workArray addObject:work];
        }
        self.works = workArray;
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.works.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cid = @"wicell";
    WorkInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:Cid];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WorkInfoCell" owner:nil options:nil] lastObject];
    }
    WorksInfo *info = self.works[indexPath.row];
    cell.work = info;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
