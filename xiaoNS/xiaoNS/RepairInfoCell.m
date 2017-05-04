//
//  RepairInfoCell.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "RepairInfoCell.h"
#import "RepairInfo.h"

@interface RepairInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *statusView;

@property (weak, nonatomic) IBOutlet UILabel *dateView;

@end

@implementation RepairInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRepair:(RepairInfo *)repair {
    _repair = repair;
    
    self.nameView.text = [repair.name substringFromIndex:11];
    self.dateView.text = repair.date;
    if (repair.status == -1) {
        self.statusView.text = @"验收未通过";
        self.statusView.textColor = [UIColor redColor];
    } else if (repair.status == 0) {
        self.statusView.text = @"进行中...";
        self.statusView.textColor = [UIColor blueColor];
    } else {
        self.statusView.text = @"验收通过";
        self.statusView.textColor = [UIColor greenColor];
    }
    
}

@end
