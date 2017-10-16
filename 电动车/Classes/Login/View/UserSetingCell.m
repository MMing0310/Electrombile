//
//  UserSetingCell.m
//  电动车
//
//  Created by dongmingming on 2017/10/16.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "UserSetingCell.h"

@implementation UserSetingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.nameTF.textColor = UIColorFromHex(808080);
    self.addressTF.textColor = UIColorFromHex(808080);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
