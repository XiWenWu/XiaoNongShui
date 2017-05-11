//
//  subManage.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 
 "date": "2017-04-19",
 "name": "2017年04月19日北头干管护",
 "id": 4,
 "status": 1
 */

#import <Foundation/Foundation.h>

@interface subManage : NSObject

@property(nonatomic, copy) NSString *date;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger status;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)subManageWithDict:(NSDictionary *)dict;

@end
