//
//  NPictureController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NPictureController.h"

#import "subPicture.h"

@interface NPictureController ()

@property(nonatomic, strong)NSArray *subPictures;

@end

@implementation NPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.imgs);
    [self setSubPictures];
    [self setAllImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSubPictures {
    NSMutableArray *dictArray = [NSMutableArray array];
    NSDictionary *subPicturesArray = self.imgs;
    for (NSDictionary *dict in subPicturesArray) {
        subPicture *pic = [subPicture subPictureWithDict:dict];
        [dictArray addObject:pic];
    }
    self.subPictures = dictArray;
}

- (void)setAllImages {
    UIImageView *img = [[UIImageView alloc] init];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
