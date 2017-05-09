//
//  WorkInfoCell.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/28.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
图片信息
@property (nonatomic, copy) NSString *img;
权证编码
@property (nonatomic, copy) NSString *abcd;
用户手机号
@property (nonatomic, copy) NSString *phone;
用户姓名
@property (nonatomic, copy) NSString *person;
地址
@property (nonatomic, copy) NSString *address;
项目地址
@property (nonatomic, copy) NSString *projectName;
 */

#import "WorkInfoCell.h"
#import "WorksInfo.h"

@interface WorkInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *projectName;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *abcd;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *person;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@end

@implementation WorkInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setWork:(WorksInfo *)work {
    _work = work;
    self.projectName.text = work.projectName;
    self.img.image        = [UIImage imageNamed:work.img];
    self.abcd.text        = work.abcd;
    self.address.text     = work.address;
    self.person.text      = work.person;
    self.phone.text       = work.phone;
    
}

+ (WorkInfoCell *)setWorkInfoCell:(WorksInfo *)work ForTableView:(UITableView *)tableView {
    static NSString *workID = @"work";
    WorkInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:workID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WorkInfoCell" owner:nil options:nil] lastObject];
    }
    cell.work = work;
    return cell;
}

@end








