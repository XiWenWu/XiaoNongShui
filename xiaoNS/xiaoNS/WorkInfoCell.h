//
//  WorkInfoCell.h
//  xiaoNS
//
//  Created by 希文 on 2017/4/28.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WorksInfo;

@interface WorkInfoCell : UITableViewCell
/** 单个cell模型数据 */
@property (nonatomic, strong) WorksInfo *work;
/** 封装cell */
+ (WorkInfoCell *)setWorkInfoCell:(WorksInfo *)work ForTableView:(UITableView *)tableView;

@end
