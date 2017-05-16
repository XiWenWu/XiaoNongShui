//
//  ServerResponseModel.h
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerResponseModel : NSObject

@property (nonatomic, assign) ErrorCode errorCode;//0:表示网络请求成功，直接去result中取值  非0：表示失败，直接显示errorMessage提示信息
@property (nonatomic, copy) NSString * errorMessage;//网络请求返回信息
@property (nonatomic, strong) id result;//后台返回的result数据，可能是数组、model对象、nsnumber、nsstring
@property (nonatomic, strong)PageModel *page;//分页（如果没有用到，则该值为nil）

- (ServerResponseModel *)initWithServerResponse:(NSDictionary *)JSONObject ResultType:(ServerResponseResultType)type ModelClassName:(NSString *)className;

@end
