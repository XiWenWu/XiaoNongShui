//
//  ManageInfoCell.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "ManageInfoCell.h"
#import "ManageInfo.h"

@interface ManageInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *statusView;
@property (weak, nonatomic) IBOutlet UILabel *dateView;


@end

@implementation ManageInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setManage:(ManageInfo *)manage {
    _manage = manage;
    self.nameView.text = [manage.name substringFromIndex:11];
    self.dateView.text = manage.date;
    if (manage.status == -1) {
        self.statusView.text = @"验收未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (manage.status == 0) {
        self.statusView.text = @"进行中";
        self.statusView.textColor = [UIColor blueColor];
    } else {
        self.statusView.text = @"验收通过";
        self.statusView.textColor = [UIColor greenColor];
    }
}

+ (ManageInfoCell *)setTableView:(UITableView *)tableView ManageInfoCell:(ManageInfo *)manage {
    static NSString *manageID = @"manage";
    
    ManageInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:manageID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageInfoCell" owner:nil options:nil] lastObject];
    }
    cell.manage = manage;
    
    return cell;
}

@end
