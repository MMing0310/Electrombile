//
//  LoginController.m
//  电动车
//
//  Created by dongmingming on 2017/10/17.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LoginController.h"
#import "FogetPasswordController.h"
@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *currentBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImg;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 按钮点击事件
//取消
- (IBAction)ClickAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 进入
- (IBAction)loginAction:(UIButton *)sender {
    
}

// 忘记密码
- (IBAction)forgetAction:(UIButton *)sender {
    FogetPasswordController *controller = [[FogetPasswordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

// 左侧按钮
- (IBAction)leftAction:(UIButton *)sender {
    NSString *currtentStr = self.currentBtn.titleLabel.text;
    NSString *leftStr = self.leftBtn.titleLabel.text;
    [self.currentBtn setTitle:leftStr forState:UIControlStateNormal];
    [self.leftBtn setTitle:currtentStr forState:UIControlStateNormal];
    
}

// 右侧按钮
- (IBAction)rightAction:(UIButton *)sender {
    NSString *currtentStr = self.currentBtn.titleLabel.text;
    NSString *rightStr = self.rightBtn.titleLabel.text;
    [self.currentBtn setTitle:rightStr forState:UIControlStateNormal];
    [self.rightBtn setTitle:currtentStr forState:UIControlStateNormal];
    
}

// 判断当前是否是交警端
- (void)currentClient {
    NSString *currtentStr = self.currentBtn.titleLabel.text;
    if ([currtentStr isEqualToString:@"交警登录"]) {
        self.phoneImg.image = [UIImage imageNamed:@"phone"];
        self.userNameTF.placeholder = @"请输入警号";
    }else {
        self.phoneImg.image = [UIImage imageNamed:@"phone"];
        self.userNameTF.placeholder = @"请输入手机号";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
