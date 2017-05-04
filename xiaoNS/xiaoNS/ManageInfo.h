//
//  ManageInfo.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/4.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManageInfo : NSObject
/** 项目名称 */
@property (nonatomic, copy) NSString *name;
/** 项目状态 */
@property (nonatomic, assign) int status;
/** 时间 */
@property (nonatomic, copy) NSString *date;

- (instancetype) initWithDict:(NSDictionary *)dict;

+ (instancetype) manageWithDict:(NSDictionary *)dict;

@end
