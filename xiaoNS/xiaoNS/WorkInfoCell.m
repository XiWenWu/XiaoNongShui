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

#import "UIImageView+WebCache.h"
#import "UIImage+XW.h"

@interface WorkInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *projectName;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *abcd;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *person;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIImageView *topBG;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBG;

@end

@implementation WorkInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"hhh");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        NSLog(@"111");
//    }
//    return self;
//}

- (void)setWork:(WorksInfo *)work {
    _work = work;
    self.projectName.text = work.projectName;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cloudowr.oss-cn-hangzhou.aliyuncs.com/nsgcgl/420921/%@?x-oss-process=style/thumb_100_100", self.work.img]];
    [self.img sd_setImageWithURL:url];
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
        [cell setCommonImage];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.work = work;
    return cell;
}

- (void)setCommonImage {
    // 设置cell正常状态和选中状态
    self.topBG.image = [UIImage resizedImageWithName:@"topBG"];
    self.topBG.highlightedImage = [UIImage resizedImageWithName:@"topBG_highlighted"];
    self.bottomBG.image = [UIImage resizedImageWithName:@"bottomBG"];
    self.bottomBG.highlightedImage = [UIImage resizedImageWithName:@"bottomBG_highlighted"];
    // 设置cell的选中背景
    self.selectedBackgroundView = [[UIView alloc] init];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y += WorkInfoCellBorder;
    // cell 香油偏移5个像素
    frame.origin.x = WorkInfoCellBorder;
    // 保证cell居中，cell整体宽度需要缩进10个像素
    frame.size.width -= 2 * WorkInfoCellBorder;
    // cell上下间距
    frame.size.height -= WorkInfoCellBorder;
    
    [super setFrame:frame];
}
@end








