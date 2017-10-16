//
//  ConfigModel.h
//  OrderApp
//
//  Created by CC on 16/8/6.
//  Copyright © 2016年 CC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConfigModel : NSObject

+ (void)showHud:(UIViewController *)vc;

+ (void)hideHud:(UIViewController *)vc;

+ (void)saveBoolObject:(BOOL)Object forKey:(NSString *)key ;

+ (BOOL)getBoolObjectforKey:(NSString *)key ;

+ (void)saveString:(NSString *)string forKey:(NSString *)key;

+(void)saveName:(NSString*)string forKey:(NSString *)key ;

+ (NSString *)getStringforKey:(NSString *)key;

+(void)mbProgressHUD:(NSString *)message andView:(UIView *)view;

+ (void)saveArr:(NSMutableArray *)arr forKey:(NSString *)key;

+ (NSMutableArray *)getArrforKey:(NSString *)key;

+ (void)saveIntegerObject:(NSInteger)Object forKey:(NSString *)key;

+ (int)getIntObjectforKey:(NSString *)key;

+(NSString*)userName;

@end
