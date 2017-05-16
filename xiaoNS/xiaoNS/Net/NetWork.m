//
//  NetWork.m
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NetWork.h"
#import "AFNetworking.h"
static AFHTTPSessionManager *manager = nil;
@interface NetWork ()

@end
@implementation NetWork

+ (NetWork *)shareInstance
{
    __strong static NetWork *netWork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWork = [[NetWork alloc]init];
    });
    return netWork;
}

- (instancetype)init
{
    if (self == [super init]) {
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = 20;
        [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc]init];
        securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy = securityPolicy;
    }
    return self;
}
@end
