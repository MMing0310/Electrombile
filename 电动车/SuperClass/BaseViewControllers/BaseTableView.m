//
//  BaseTableView.m
//  EasyMake
//
//  Created by cc on 2017/5/10.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "BaseTableView.h"
#import "TBRefresh.h"

@interface BaseTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BaseTableView

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent animated:YES];
    [self.view addSubview:self.CC_table];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_xx"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(callChatView)];
}

#pragma mark - Action  ---> NeedReset in son
- (void)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)more:(UIButton *)sender {
    NSLog(@"NeedReset in son");
}

-(void) callChatView{
    
}

- (void)CC_reloadDate {
    // 模拟延时设置
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.CC_table.header endHeadRefresh];
        
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 写这个方法防止报警告，只要子类中覆盖这个方法就不会影响显示
    return nil;
}

- (UITableView *)CC_table {
    if (!_CC_table) {
        _CC_table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 64 - 50) style:UITableViewStylePlain];
        _CC_table.backgroundColor = [UIColor whiteColor];
        _CC_table.delegate = self;
        _CC_table.dataSource = self;
        [_CC_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        WeakSelf(weakself);
        [_CC_table addRefreshHeaderWithBlock:^{
            [weakself CC_reloadDate];
        }];
    }
    return _CC_table;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
