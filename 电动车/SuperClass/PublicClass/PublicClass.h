//
//  PublicClass.h
//  BaseProject
//
//  Created by lxl on 2017/6/29.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicClass : NSObject
+ (UIButton *)setRightTitleOnTargetNav:(id)controller action:(SEL)action Title:(NSString *)title;
+ (UIButton *)setLeftButtonItemOnTargetNav:(id)controller action:(SEL)action image:(UIImage *)image Title:(NSString *)title;
//+ (UIButton *)setLeftTitleOnTargetNav:(id)controller action:(SEL)action Title:(NSString *)title;
/**
 根据颜色返回图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size ;
//中间文字
+ (UILabel *)seTitleViewOnTargetNav:(id)controller UIFont:(UIFont *)font title:(NSString *)title textColor:(UIColor *)color;

/**
 判断颜色是够相同
 */
+(BOOL)firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor;
@end
