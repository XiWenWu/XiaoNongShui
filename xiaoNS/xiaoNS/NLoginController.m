//
//  NLoginController.m
//  xiaoNS
//
//  Created by 希文 on 2017/4/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NLoginController.h"
#import "NTabBarController.h"
#import "MBProgressHUD+MJ.h"

@interface NLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)login;

@end

@implementation NLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.loginBtn.enabled = NO;
    // 设置监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 当账号和密码的输入框被点击时会调用 */
- (void)textChange {
    // 当账号和密码都有内容的时候，设置登录按钮显示为可以点击
    self.loginBtn.enabled = (self.accountField.text.length && self.pwdField.text.length);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login {
    if (![self.accountField.text isEqualToString:@"123456"]) {
        [MBProgressHUD showError:@"账号错误"];
        return;
    }
    if (![self.pwdField.text isEqualToString:@"123456"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    [MBProgressHUD showMessage:@"正在登录..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        // self.window.rootViewController = [[NTabBarController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = [[NTabBarController alloc] init];
    });
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
