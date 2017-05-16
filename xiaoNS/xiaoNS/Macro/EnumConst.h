//
//  EnumConst.h
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnumConst : NSObject

/**
 *  服务器返回的字典中result类型：数组、字典、整形
 */
typedef NS_ENUM(NSUInteger, ServerResponseResultType){
    /**
     *  数组
     */
    ServerResponseResultType_NSArray,
    /**
     *  字典
     */
    ServerResponseResultType_NSDictionary,
    /**
     *  数字
     */
    ServerResponseResultType_NSNumber,
    /**
     *  字符串
     */
    ServerResponseResultType_NSString,
    /**
     *  对象
     */
    ServerResponseResultType_NSObject,
    /**
     *  bool值
     *  如果需要返回值是bool  这里封装成NSNumber @1：YES  @2：NO
     */
    ServerResponseResultType_BOOL
};

#pragma mark - ServerResponseModel
/**
 *  网络请求成功与否标志
 */
typedef NS_ENUM(NSInteger, ErrorCode){
    /**
     *  请求成功
     */
    ErrorCode_Success = 0,
    /**
     *  请求失败
     */
    ErrorCode_Failed = -1
};
@end
