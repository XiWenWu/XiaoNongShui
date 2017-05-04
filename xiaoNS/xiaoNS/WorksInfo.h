//
//  WorksInfo.h
//  xiaoNS
//
//  Created by 希文 on 2017/4/27.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorksInfo : NSObject
/**图片信息*/
@property (nonatomic, copy) NSString *img;
/**权证编码*/
@property (nonatomic, copy) NSString *abcd;
/**用户手机号*/
@property (nonatomic, copy) NSString *phone;
/**用户姓名*/
@property (nonatomic, copy) NSString *person;
/**地址*/
@property (nonatomic, copy) NSString *address;
/**项目地址*/
@property (nonatomic, copy) NSString *projectName;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) workWithDict:(NSDictionary *)dict;
@end
