//
//  NSearchController.h
//  xiaoNS
//
//  Created by 希文 on 2017/5/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
// 滚动条的高度
#define PickerViewH 240
// 间距
#define margin 10
// 屏幕宽度
#define viewW self.view.frame.size.width
// 字体高度
#define labelH 44
@protocol NSearchControllerDelegate<NSObject>
@optional
- (void)getNSearchCountry:(NSString *)country Town:(NSString *)town;
@end


@interface NSearchController : UIViewController

@property (weak, nonatomic) id<NSearchControllerDelegate> delegate;

@end
