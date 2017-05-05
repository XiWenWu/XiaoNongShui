//
//  NManageController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//
// 导入控制器
#import "NManageController.h"
// 导入工具
#import "AFHTTPSessionManager.h"
// 导入模型
#import "ManageInfo.h"
#import "ManageInfoCell.h"

@interface NManageController ()

@property (nonatomic, strong) NSArray *manages;

@end

@implementation NManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    [self setManages];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"管护";
}

- (void)setManages {
    // 网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //
    [manager GET:@"http://www.cloudowr.com:8801/nsgcgl/api/v3/maintainList?key=android&userid=1" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *dictArray = responseObject[@"ret"];
        
        NSMutableArray *manageArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            ManageInfo *manage = [ManageInfo manageWithDict:dict];
            [manageArray addObject:manage];
        }
        self.manages = manageArray;
        
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
    return self.manages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *manageID = @"manage";
//    ManageInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:manageID];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageInfoCell" owner:nil options:nil] lastObject];
//    }
//    ManageInfo *manage = self.manages[indexPath.row];
//    
//    cell.manage = manage;
    
    ManageInfoCell *cell = [ManageInfoCell setTableView:tableView ManageInfoCell:self.manages[indexPath.row]];
    
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
