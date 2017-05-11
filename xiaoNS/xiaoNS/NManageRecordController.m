//
//  NManageRecordController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NManageRecordController.h"

#import "subManage.h"
#import "subManageCell.h"

@interface NManageRecordController ()

@property(nonatomic ,strong) NSArray *subManages;

@end

@implementation NManageRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"%@", self.maintain);
    [self setSubManages];
    //[self.tableView reloadData];
}
//NSArray *dictArray = responseObject[@"ret"][@"list"];
//// 将字典数据转为模型数据
//NSMutableArray *workArray = [NSMutableArray array];
//// 遍历，转换
//for (NSDictionary *dict in dictArray) {
//    WorksInfo *work = [WorksInfo workWithDict:dict];
//    // 添加模型
//    [workArray addObject:work];
//}
//self.works = workArray;
- (void)setSubManages {
    NSMutableArray *subManagesArray = [NSMutableArray array];
    NSDictionary *dictArray = self.maintain;
    for (NSDictionary *dict in dictArray) {
        subManage *manage = [subManage subManageWithDict:dict];
        [subManagesArray addObject:manage];
    }
    self.subManages = subManagesArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.subManages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *subManageID = @"subManage";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:subManageID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:subManageID];
//    }
//    subManage *manage = self.subManages[indexPath.row];
//    cell.textLabel.text = manage.date;
//    cell.detailTextLabel.text = manage.name;
    
    //    static NSString *Cid = @"wicell";
    //    WorkInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:Cid];
    //    if (cell == nil) {
    //        cell = [[[NSBundle mainBundle] loadNibNamed:@"WorkInfoCell" owner:nil options:nil] lastObject];
    //    }
    //    WorksInfo *info = self.works[indexPath.row];
    //    cell.work = info;
    static NSString *subManageID = @"subManageID";
    subManageCell *cell = [tableView dequeueReusableCellWithIdentifier:subManageID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"subManageCell" owner:nil options:nil] lastObject];
    }
    subManage *manage = self.subManages[indexPath.row];
    cell.manage = manage;
    
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
