//
//  ManageInfoCell.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ManageInfo;

@interface ManageInfoCell : UITableViewCell

@property (nonatomic, strong) ManageInfo *manage;

+ (ManageInfoCell *)setTableView:(UITableView *)tableView ManageInfoCell:(ManageInfo *)manage;

@end
