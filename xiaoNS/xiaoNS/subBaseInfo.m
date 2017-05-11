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
        self.id         = dict[@"id"];
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

@end
