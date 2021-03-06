//
//  NextBindController.m
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "NextBindController.h"
#import "NextBindCell.h"
#import "CustomBtnCell.h"
@interface NextBindController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end

@implementation NextBindController

- (void)viewDidLoad {
    [super viewDidLoad];


    // 相关配置
    [self configSubView];
    
}

// 相关配置
- (void)configSubView {
    // 标题
    [self setNavTitle:@"绑定2"];
    
}

// 返回按钮
- (void)backAction {
    [self.navigationController popViewControllerAnimated:true];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"NextBindCell";
        NextBindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (NextBindCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor whiteColor];
            
        }
        
        return cell;
    }else {
        static NSString *CellIdentifier = @"CustomBtnCell";
        CustomBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (CustomBtnCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor whiteColor];
            
        }
        [cell.confirmBtn setTitle:[NSString stringWithFormat:@"完成绑定"] forState:UIControlStateNormal];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 255;
    }else {
        return 80;
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
