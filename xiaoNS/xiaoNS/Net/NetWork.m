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

- (void)requestData:(NSString *)path params:(NSDictionary *)params completion:(void (^)(id JSONObject))completion {
    [manager.requestSerializer setValue:@"tokenKey" forHTTPHeaderField:@"token"];
    path = [NSString stringWithFormat:@"%@%@",@"ip地址",path];
    if (_isGetMethod) {
        [manager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (completion) {
                completion(result);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(@{@"errorMsg":error.localizedDescription});
            }
        }];
    } else {
        [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (completion) {
                completion(result);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(@{@"errorMsg":error.localizedDescription});
            }
        }];
    }
}
@end
