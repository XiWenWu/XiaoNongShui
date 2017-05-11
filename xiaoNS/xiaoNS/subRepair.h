//
//  subRepair.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 "date": "2017-04-19",
 "name": "界河村北头干塘堰维修",
 "id": 5,
 "status": 0
 */

#import <Foundation/Foundation.h>

@interface subRepair : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger status;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)subRepairWithDict:(NSDictionary *)dict;


@end
