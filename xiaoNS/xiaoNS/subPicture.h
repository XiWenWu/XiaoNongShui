//
//  subPicture.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//
/*
 "date": "2017-04-29 00:27",
 "id": 14475,
 "usetype": 0,
 "url": "aca4540736234676b936f2ea7e32effc.jpg"
 */

#import <Foundation/Foundation.h>

@interface subPicture : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) long long ID;
@property (nonatomic, assign) NSInteger usetype;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)subPictureWithDict:(NSDictionary *)dict;


@end
