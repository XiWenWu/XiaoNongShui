//
//  RepairInfoCell.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RepairInfo;

@interface RepairInfoCell : UITableViewCell

@property (nonatomic, strong) RepairInfo *repair;

+ (RepairInfoCell *) setTableView:(UITableView *)tableView RepairInfoCell:(RepairInfo *)repair;

@end
