//
//  NRepairController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//
// 导入控制器
#import "NRepairController.h"
// 导入工具
#import "AFHTTPSessionManager.h"
// 导入模型
#import "RepairInfo.h"
#import "RepairInfoCell.h"


@interface NRepairController ()

@property (nonatomic, strong) NSArray *repairs;

@end

@implementation NRepairController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    self.tableView.rowHeight = 60;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"维修";
    // 初始化维修数据
    [self setRepairs];
    
}

- (void)setRepairs {
    // 创建网络请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 发送请求
    [manager GET:@"http://www.cloudowr.com:8801/nsgcgl/api/v3/repairList?key=android&userid=1" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 接收网络请求返回的数据
        NSArray *dictArray = responseObject[@"ret"];
        // 新建一个可变数组
        NSMutableArray *repairArray = [NSMutableArray array];
        // 将字典数据转为模型
        for (NSDictionary *dict in dictArray) {
            RepairInfo *repair = [RepairInfo repairWithDict:dict];
            
            [repairArray addObject:repair];
        }
        self.repairs = repairArray;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败");
    }];
     
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repairs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellID = @"repair";
//    
//    RepairInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"RepairInfoCell" owner:nil options:nil] lastObject];
//    }
//    // 获得模型数据
//    RepairInfo *repair = self.repairs[indexPath.row];
//    // 导入模型数据
//    cell.repair = repair;
    RepairInfoCell *cell = [RepairInfoCell setTableView:tableView RepairInfoCell:self.repairs[indexPath.row]];
    
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
