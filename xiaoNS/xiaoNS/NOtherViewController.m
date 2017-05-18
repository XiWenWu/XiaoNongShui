//
//  NOtherViewController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/16.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NOtherViewController.h"
#import "NTabBarController.h"
#import "AppDelegate.h"

@interface NOtherViewController ()

@end

@implementation NOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    [self setWebViewForSubURLd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openOrCloseLeftList {
    NSLog(@"click");
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tempAppDelegate.LeftSlideVC;
    
}

- (void)setWebViewForSubURLd{
    UIWebView *web = [[UIWebView alloc] init];
    
    CGSize size = self.view.frame.size;
    
    web.frame = CGRectMake(0, 0, size.width, size.height);

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.subURL]];
    
    [self.view addSubview:web];
    
    [web loadRequest:request];
    
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
