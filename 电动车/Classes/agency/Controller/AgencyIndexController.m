//
//  AgencyIndexController.m
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "AgencyIndexController.h"
#import "SettingController.h"
#import "FirstBindController.h"
#import "BindCell.h"
#import "UnBindCell.h"

@interface AgencyIndexController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *typeView;
// 已绑定
@property (weak, nonatomic) IBOutlet UIButton *bindBtn;
// 未绑定
@property (weak, nonatomic) IBOutlet UIButton *unBindBtn;
// 滑动条
@property (weak, nonatomic) IBOutlet UIView *slideView;
// 记录点击的button
@property (nonatomic, assign) NSUInteger index;

@end

@implementation AgencyIndexController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 相关配置
    [self configSubView];
}

// 相关配置
- (void)configSubView {
    // 初始化
    self.index = 0;
    // 颜色
    [self.unBindBtn setTitleColor:[UIColor colorWithHexString:@"808080"] forState:UIControlStateNormal];
}

// button点击事件
- (IBAction)buttonClick:(id)sender {
    for (UIView * v in self.typeView.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton *)v;
            if ([btn isEqual:sender]) {
                btn.selected = YES;
                [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }else {
                [btn setTitleColor:[UIColor colorWithHexString:@"808080"] forState:UIControlStateNormal];
                btn.selected = NO;
            }
        }
    }
    UIButton * btn = (UIButton *)sender;
    btn.selected = YES;
    if (btn.tag == 0) {
        // 绑定
        self.index = 0;
    }else  if (btn.tag == 1) {
        // 未绑定
        self.index = 1;
    }
    
    [UIView animateWithDuration:.4 animations:^{
        CGRect rect = self.slideView.frame;
        rect.origin.x = btn.frame.origin.x + 30;
        self.slideView.frame = rect;
        
    } completion:^(BOOL finished) {
        
    }];
    // 刷新列表
    [self.tableView reloadData];
}

// 设置
- (IBAction)settingAction:(UIBarButtonItem *)sender {
    // 修改密码
    SettingController *controller = [[SettingController alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.index == 0) {
        return  2;
    }else {
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.index == 0) {
        return 10;
    }else {
        return 15;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.index == 0) {
        static NSString *CellIdentifier = @"BindCell";
        BindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (BindCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        }
        
        return cell;
    }else {
        static NSString *CellIdentifier = @"UnBindCell";
        UnBindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (UnBindCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        }
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.index == 1) {
        // 绑定
        FirstBindController *controller = [[FirstBindController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return  30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
    headerView.backgroundColor = [UIColor colorWithHexString:@"f8f7fc"];
    
    if (self.index == 0) {
        UILabel *dateLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 60, 30)];
        dateLab.text = @"10月8日";
        dateLab.font = [UIFont systemFontOfSize:12.0];
        [headerView addSubview:dateLab];
        // 绑定数量
        UILabel *mountLab = [[UILabel alloc] initWithFrame:CGRectMake(85, 0, kScreenW - 110, 30)];
        mountLab.textAlignment = NSTextAlignmentRight;
        mountLab.text = @"共绑定1111张，本日绑定44张";
        mountLab.font = [UIFont systemFontOfSize:12.0];
        [headerView addSubview:mountLab];
    }else {
        // 绑定数量
        UILabel *mountLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreenW - 40, 30)];
        mountLab.textAlignment = NSTextAlignmentCenter;
        mountLab.text = @"剩余44张";
        mountLab.font = [UIFont systemFontOfSize:12.0];
        [headerView addSubview:mountLab];
    }
    
    return  headerView;
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
