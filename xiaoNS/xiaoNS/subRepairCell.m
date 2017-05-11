//
//  subRepairCell.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "subRepairCell.h"

#import "subRepair.h"

@interface subRepairCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *dateView;
@property (weak, nonatomic) IBOutlet UILabel *statusView;


@end

@implementation subRepairCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRepair:(subRepair *)repair {
    _repair = repair;
    self.nameView.text = repair.name;
    self.dateView.text = repair.date;
    if (repair.status == -2) {
        self.statusView.text = @"县审批未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (repair.status == -1) {
        self.statusView.text = @"乡镇审批未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (repair.status == 0) {
        self.statusView.text = @"申报中";
        self.statusView.textColor = [UIColor yellowColor];
    } else if (repair.status == 1) {
        self.statusView.text = @"乡镇审批通过";
        self.statusView.textColor = [UIColor blueColor];
    } else if (repair.status == 2) {
        self.statusView.text = @"施工中";
        self.statusView.textColor = [UIColor greenColor];
    } else {
        self.statusView.text = @"暂无数据";
    }
}


@end
