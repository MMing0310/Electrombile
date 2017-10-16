//
//  ConfigModel.m
//  OrderApp
//
//  Created by CC on 16/8/6.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "ConfigModel.h"
#import <MBProgressHUD.h>
@implementation ConfigModel

+ (void)showHud:(UIViewController *)vc {
    [MBProgressHUD showHUDAddedTo:vc.view animated:YES];
}

+ (void)hideHud:(UIViewController *)vc {
    [MBProgressHUD hideHUDForView:vc.view animated:YES];
}

+ (void)saveBoolObject:(BOOL)Object forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:Object forKey:key];
    [defaults synchronize];
}

+ (BOOL)getBoolObjectforKey:(NSString *)key {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    BOOL value = [[user objectForKey:key] boolValue];;
    return value;
}

+ (void)saveIntegerObject:(NSInteger)Object forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:Object forKey:key];
    [defaults synchronize];
}

+ (int)getIntObjectforKey:(NSString *)key {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    int value = [[user objectForKey:key] intValue];;
    return value;
}

+ (void)saveArr:(NSMutableArray *)arr forKey:(NSString *)key {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *getdata = [user objectForKey:key];
    NSMutableArray *infoArr = [NSKeyedUnarchiver unarchiveObjectWithData:getdata];
    NSMutableArray *mutableCopyArr;
    
    if (infoArr.count>0) {
        mutableCopyArr = [infoArr mutableCopy];
    }else {
        mutableCopyArr = [NSMutableArray new];
    }
    
    [mutableCopyArr addObjectsFromArray:arr];
    NSData * data  = [NSKeyedArchiver archivedDataWithRootObject:mutableCopyArr];
    [[NSUserDefaults standardUserDefaults] setValue:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+ (NSMutableArray *)getArrforKey:(NSString *)key {
     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:key];
    NSMutableArray *userDefaultsArr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSMutableArray *mutableCopyArr = [userDefaultsArr mutableCopy];
    return mutableCopyArr;
}


+ (void)saveString:(NSString *)string forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey:key];
    [defaults synchronize];
}


+(NSString*)userName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserNickName];
}


+(void)saveName:(NSString*)string forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey:key];
    [defaults synchronize];
}


+ (NSString *)getStringforKey:(NSString *)key {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString * string = [NSString stringWithFormat:@"%@", [user objectForKey:key]];
    return string;
}

+(void)mbProgressHUD:(NSString *)message andView:(UIView *)view
{

    if ([message isEqualToString:@""]||message==nil) {
        return;
    }else{
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        UIView *showview =  [[UIView alloc]init];
        showview.backgroundColor =[UIColor colorWithRed:(37)/255.0 green:(37)/255.0 blue:(37)/255.0 alpha:(0.8)];
        showview.frame = CGRectMake(1, 1, 1, 1);
        showview.alpha = 1.0f;
        showview.layer.cornerRadius = 4.0f;
        showview.layer.masksToBounds = YES;
        [window addSubview:showview];
        
        UILabel *label = [[UILabel alloc]init];
        
        CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(kScreenW-100, 9000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size;
        
        label.frame = CGRectMake(10, 10, LabelSize.width, LabelSize.height);
        label.text = message;
        label.numberOfLines=0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = 1;
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:15];
        [showview addSubview:label];
        
        showview.frame = CGRectMake((kScreenW - LabelSize.width - 20)/2, (kScreenH-LabelSize.height)/2, LabelSize.width+20, LabelSize.height+20);
        [UIView animateWithDuration:3.0 animations:^{
            showview.alpha = 0;
        } completion:^(BOOL finished) {
            [showview removeFromSuperview];
        }];
    }
}



@end
