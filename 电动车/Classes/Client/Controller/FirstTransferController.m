//
//  FirstTransferController.m
//  电动车
//
//  Created by dongmingming on 2017/10/17.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "FirstTransferController.h"
#import "InfoCell.h"
#import "NextBindCell.h"
#import "CustomBtnCell.h"
@interface FirstTransferController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FirstTransferController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 相关配置
    [self configSubView];
}

// 相关配置
- (void)configSubView {
    // 标题
    [self setNavTitle:@"过户"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"InfoCell";
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (InfoCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor whiteColor];
            
        }
        
        return cell;
    }else if (indexPath.row == 1) {
        static NSString *CellIdentifier = @"NextBindCell";
        NextBindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (NextBindCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor whiteColor];
            
        }
        cell.titleLab.text = @"当前车主信息";
        return cell;
    }else if (indexPath.row == 2) {
        return nil;
    }else {
        static NSString *CellIdentifier = @"CustomBtnCell";
        CustomBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (CustomBtnCell *)[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor whiteColor];
            
        }
        [cell.confirmBtn setTitle:@"下一步" forState:UIControlStateNormal];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 140;
    }else if (indexPath.row == 1) {
        return 350;
    }else if (indexPath.row == 2) {
        return 0;
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
