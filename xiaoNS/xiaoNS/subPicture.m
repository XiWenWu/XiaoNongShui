//
//  subPicture.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "subPicture.h"

@implementation subPicture

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.date    = dict[@"date"];
        self.ID      = [dict[@"id"] intValue];
        self.usetype = [dict[@"usetype"] intValue];
        self.url     = dict[@"url"];
    }
    return self;
}
+ (instancetype)subPictureWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
