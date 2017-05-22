//
//  INSNetWork.h
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol INSNetWork <NSObject>

/**
 *  用户登陆
 *  @param request 登陆请求model
 *  @param completion   返回数据的block
 */
- (void)queryProjectList:(QueryProjectListRequest*)request completion:(void(^)(id JSONObject))completio;

@end
