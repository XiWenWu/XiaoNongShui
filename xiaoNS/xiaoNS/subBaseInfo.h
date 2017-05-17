//
//  subBaseInfo.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/11.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface subBaseInfo : NSObject
/**工程编号*/
@property (nonatomic, copy) NSString *ID;
/**名称*/
@property (nonatomic, copy) NSString *name;
/**乡镇*/
@property (nonatomic, copy) NSString *town;
/**村*/
@property (nonatomic, copy) NSString *village;
/**组*/
@property (nonatomic, copy) NSString *group;
/**行政区划*/
@property (nonatomic, copy) NSString *adcd;
/**自定义编号*/
@property (nonatomic, copy) NSString *cuscode;
/**功能*/
@property (nonatomic, copy) NSString *fun;
/**性质*/
@property (nonatomic, copy) NSString *prop;
/**管护责任人*/
@property (nonatomic, copy) NSString *guard;
/**责任人电话*/
@property (nonatomic, copy) NSString *phone;
/**调查人员*/
@property (nonatomic, copy) NSString *username;
/**登记时间*/
@property (nonatomic, copy) NSString *checktime;
/**受益户数*/
@property (nonatomic, copy) NSString *household;
/**收益人数*/
@property (nonatomic, copy) NSString *population;
/**受益面积*/
@property (nonatomic, copy) NSString *area_num;
/**坝梗截面*/
@property (nonatomic, copy) NSString *section;
/**坝梗长度*/
@property (nonatomic, copy) NSString *len;
/**坝梗高度*/
@property (nonatomic, copy) NSString *height;
/**坝梗宽度*/
@property (nonatomic, copy) NSString *width;
/**溢洪道尺寸*/
@property (nonatomic, copy) NSString *size;
/**最大蓄水面积*/
@property (nonatomic, copy) NSString *waterarea;
/**最大需水量*/
@property (nonatomic, copy) NSString *capacity;
/**最大蓄水深度*/
@property (nonatomic, copy) NSString *depth;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)subBaseInfoWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)arrayWithDict:(NSDictionary *)dict;


@end
