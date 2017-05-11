//
//  subManageCell.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "subManageCell.h"
#import "subManage.h"

@interface subManageCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *dateView;
@property (weak, nonatomic) IBOutlet UILabel *statusView;

@end

@implementation subManageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setManage:(subManage *)manage {
    _manage = manage;
    if (manage.name.length > 11) {
        self.nameView.text = [manage.name substringFromIndex:11];
    } else {
        self.nameView.text = manage.name;
    }
    
    self.dateView.text = manage.date;
    if (manage.status == -2) {
        self.statusView.text = @"县审批未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (manage.status == -1) {
        self.statusView.text = @"乡镇审批未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (manage.status == 0) {
        self.statusView.text = @"验收中";
        self.statusView.textColor = [UIColor yellowColor];
    } else if (manage.status == 1) {
        self.statusView.text = @"乡镇验收通过";
        self.statusView.textColor = [UIColor blueColor];
    } else if (manage.status == 2) {
        self.statusView.text = @"完工";
        self.statusView.textColor = [UIColor greenColor];
    } else {
        self.statusView.text = @"暂无数据";
    }

    
}

@end
