//
//  PageModel.h
//  xiaoNS
//
//  Created by wcq on 17/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageModel : NSObject

@property (nonatomic, strong) NSString *pageExtend;//当前页说明
@property (nonatomic, assign) NSInteger pageCount;//总页数
@property (nonatomic, assign) NSInteger pageNo;//从1开始
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger recordCount;//总记录数

@end
