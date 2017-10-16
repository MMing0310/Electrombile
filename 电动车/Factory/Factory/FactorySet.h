//
//  FactorySet.h
//  BaseProject
//
//  Created by cc on 2017/6/22.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactorySet : NSObject

+ (UIBarButtonItem*)createBackBarButtonItemWithTarget:(id)target action:(SEL)action;

+ (UIBarButtonItem*)createCloseBarButtonItemWithTarget:(id)target action:(SEL)action;

+ (UIBarButtonItem*)createBarButtonItemWithTitle:(NSString*)title addTarget:(id)target action:(SEL)action;


+ (UIBarButtonItem*)createBarButtonItemWithTitle2:(NSString*)title addTarget:(id)target action:(SEL)action;

+ (UITabBarItem*) createTabbarItem:(NSString*)title withImage:(NSString*)unimg withHeightLightImage:(NSString*)highImg;

+ (UILabel*) createThemeLabel;

+ (UIImage *)patternImageWithColor:(UIColor *)color;

@end
