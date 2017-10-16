//
//  BaseTableView.h
//  EasyMake
//
//  Created by cc on 2017/5/10.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BaseTableView : BaseViewController

@property (nonatomic, retain) UITableView *CC_table;

- (void)back:(UIButton *)sender ;

- (void)more:(UIButton *)sender ;

- (void)CC_reloadDate;

@end
