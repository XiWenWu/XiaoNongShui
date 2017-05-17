//
//  NetWork.h
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INSNetWork.h"

#define HandleServerResponseModelFromObjct(JSONObject,resultType,modelClassName)   __weak typeof(self)weakSelf = self;\
ServerResponseModel *model = [weakSelf serverResponseHandle:JSONObject ResultType:resultType ModelClass:modelClassName];\
completion(model);
@interface NetWork : NSObject<INSNetWork>

@property (nonatomic, assign) BOOL isGetMethod;
+ (NetWork *)shareInstance;

@end
