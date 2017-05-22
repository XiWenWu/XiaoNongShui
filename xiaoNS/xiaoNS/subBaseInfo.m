//
//  subBaseInfo.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *town;
@property (nonatomic, copy) NSString *village;
@property (nonatomic, copy) NSString *group;
 
@property (nonatomic, copy) NSString *adcd;
@property (nonatomic, copy) NSString *cuscode;
@property (nonatomic, copy) NSString *fun;
@property (nonatomic, copy) NSString *prop;
@property (nonatomic, copy) NSString *guard;
 
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *checktime;
@property (nonatomic, copy) NSString *household;
@property (nonatomic, copy) NSString *population;
 
@property (nonatomic, copy) NSString *area_num;
@property (nonatomic, copy) NSString *section;
@property (nonatomic, copy) NSString *len;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *width;
 
@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSString *waterarea;
@property (nonatomic, copy) NSString *capacity;
@property (nonatomic, copy) NSString *depth;
 */

#import "subBaseInfo.h"

@implementation subBaseInfo

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.ID         = dict[@"id"];
        self.name       = dict[@"name"];
        self.town       = dict[@"town"];
        self.village    = dict[@"village"];
        self.group      = dict[@"group"];
        
        self.adcd       = dict[@"adcd"];
        self.cuscode    = dict[@"cuscode"];
        self.fun        = dict[@"fun"];
        self.prop       = dict[@"prop"];
        self.guard      = dict[@"guard"];
        
        self.phone      = dict[@"phone"];
        self.username   = dict[@"username"];
        self.checktime  = dict[@"checktime"];
        self.household  = dict[@"household"];
        self.population = dict[@"population"];
        
        self.area_num   = dict[@"area_num"];
        self.section    = dict[@"section"];
        self.len        = dict[@"len"];
        self.height     = dict[@"height"];
        self.width      = dict[@"width"];
        
        self.size       = dict[@"size"];
        self.waterarea  = dict[@"waterarea"];
        self.capacity   = dict[@"capacity"];
        self.depth      = dict[@"depth"];
        
    }
    return self;
}
+ (instancetype)subBaseInfoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)arrayWithDict:(NSDictionary *)dict {
    NSMutableArray *array = [NSMutableArray array];
    array[0] = @{@"title":@"工程编号",@"msg":[[NSString alloc] initWithFormat:@"%d",[dict[@"id"] intValue]]};
    array[1] = @{@"title":@"名称",@"msg":dict[@"name"]};
    array[2] = @{@"title":@"乡镇",@"msg":dict[@"town"]};
    array[3] = @{@"title":@"村",@"msg":dict[@"village"]};
    array[4] = @{@"title":@"组",@"msg":dict[@"group"]};
    
    array[5] = @{@"title":@"行政区划",@"msg":dict[@"adcd"]};
    array[6] = @{@"title":@"自定义编号",@"msg":dict[@"cuscode"]};
    array[7] = @{@"title":@"功能",@"msg":[[NSString alloc] initWithFormat:@"%d",[dict[@"fun"] intValue]]};
    array[8] = @{@"title":@"性质",@"msg":dict[@"prop"]};
    array[9] = @{@"title":@"管护责任人",@"msg":dict[@"guard"]};
    
    array[10] = @{@"title":@"责任人电话",@"msg":dict[@"phone"]};
    array[11] = @{@"title":@"调查人员",@"msg":dict[@"username"]};
    array[12] = @{@"title":@"登记时间",@"msg":dict[@"checktime"]};
    array[13] = @{@"title":@"受益户数",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"household"] longValue]]};
    array[14] = @{@"title":@"受益人数",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"population"] longValue]]};
    
    array[15] = @{@"title":@"受益面积",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"area_num"] longValue]]};
    array[16] = @{@"title":@"坝梗截面",@"msg":dict[@"section"]};
    array[17] = @{@"title":@"坝梗长度",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"len"] longValue]]};
    array[18] = @{@"title":@"坝梗高度",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"height"] longValue]]};
    array[19] = @{@"title":@"坝梗宽度",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"width"] longValue]]};
    
    array[20] = @{@"title":@"溢洪道尺寸",@"msg":dict[@"size"]};
    array[21] = @{@"title":@"最大蓄水面积",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"waterarea"] longValue]]};
    array[22] = @{@"title":@"最大蓄水量",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"capacity"] longValue]]};
    array[23] = @{@"title":@"最大蓄水深度",@"msg":[[NSString alloc] initWithFormat:@"%ld",[dict[@"depth"] longValue]]};
    
    return array;
}

@end
