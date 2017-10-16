//
//  SettingController.m
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "SettingController.h"
#import "FogetPasswordController.h"
#import "UserSetingCell.h"
#import "AlterPwdCell.h"
#import "ExitCell.h"

@interface SettingController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 相关配置
    [self configSubView];
}

// 相关配置
- (void)configSubView {
    // 标题
    [self setNavTitle:@"设置"];
    // 取消
    UIImage *img = [UIImage imageNamed:@"back"];
    [PublicClass setLeftButtonItemOnTargetNav:self action:@selector(backAction) image:img Title:@""];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"UserSetingCell";
        UserSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (UserSetingCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        }
        return cell;
    }else if (indexPath.row == 1) {
        static NSString *CellIdentifier = @"AlterPwdCell";
        AlterPwdCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (AlterPwdCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        }
        return cell;
    }else {
        static NSString *CellIdentifier = @"ExitCell";
        ExitCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (ExitCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        // 修改密码
        FogetPasswordController *fogetController = [[FogetPasswordController alloc] init];
        [self.navigationController pushViewController:fogetController animated:true];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 130;
    }else if (indexPath.row == 1) {
        return 45;
    }else {
        return 70;
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
