//
//  UserSetingCell.h
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSetingCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *TopLab;
@property (weak, nonatomic) IBOutlet UILabel *middleLab;
@property (weak, nonatomic) IBOutlet UILabel *bottomLab;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;



@end
