//
//  NextBindController.m
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "NextBindController.h"
#import "NextBindCell.h"
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
    [self setNavTitle:@"绑定"];
    // 取消
    UIImage *img = [UIImage imageNamed:@"back"];
    [PublicClass setLeftButtonItemOnTargetNav:self action:@selector(backAction) image:img Title:@"取消"];
}

// 返回按钮
- (void)backAction {
    [self.navigationController popViewControllerAnimated:true];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"NextBindCell";
    NextBindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (NextBindCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor whiteColor];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
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
