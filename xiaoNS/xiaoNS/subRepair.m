//
//  subRepair.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "subRepair.h"

@implementation subRepair

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.data   = dict[@"dict"];
        self.name   = dict[@"name"];
        self.ID     = [dict[@"id"] intValue];
        self.status = [dict[@"status"] intValue];
        
    }
    return self;
}

+ (instancetype)subRepairWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
