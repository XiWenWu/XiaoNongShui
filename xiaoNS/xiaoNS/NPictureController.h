//
//  NPictureController.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define picMargin 10

@interface NPictureController : UIViewController

@property (nonatomic, strong) NSDictionary *imgs;
/** */
@property (nonatomic, assign) long NPictureInputID;
/** */
@property (nonatomic, assign) long NPictureProindex;
/** */
@property (nonatomic, assign) long NPictureUserID;

@end
