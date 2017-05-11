//
//  WorksInfo.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/27.
//  Copyright © 2017年 xiwen. All rights reserved.
//
/**
 @property (nonatomic, copy) NSString *img;
 @property (nonatomic, copy) NSString *phone;
 @property (nonatomic, copy) NSString *person;
 @property (nonatomic, copy) NSString *address;
 @property (nonatomic, copy) NSString *projectName;
 */

#import "WorksInfo.h"

@implementation WorksInfo

- (instancetype) initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.ID           = dict[@"id"];
        self.img          = dict[@"img"];
        self.abcd         = dict[@"abcd"];
        self.phone        = dict[@"phone"];
        self.person       = dict[@"person"];
        self.address      = dict[@"address"];
        self.proindex     = dict[@"proindex"];
        self.projectName  = dict[@"projectName"];
    }
    return self;
}

+ (instancetype) workWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
