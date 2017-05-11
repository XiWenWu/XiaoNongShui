//
//  subManage.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "subManage.h"

@implementation subManage
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.date   = dict[@"date"] ? dict[@"date"] : @"";
        self.name   = dict[@"name"] ? dict[@"name"] : @"";
        self.ID     = [dict[@"id"] intValue] ? [dict[@"id"] intValue] : -255;
        self.status = [dict[@"status"] intValue] ? [dict[@"status"] intValue] : -255;;
    }
    return self;
}
+ (instancetype)subManageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
