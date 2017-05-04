//
//  ManageInfo.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "ManageInfo.h"

@implementation ManageInfo

- (instancetype) initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.date = dict[@"date"];
        self.status = [dict[@"status"] intValue];
    }
    return self;
}

+ (instancetype) manageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
