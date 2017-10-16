//
//  UIColor+UIColor_Hex_color.h
//  充电桩
//
//  Created by 李超杰 on 17/4/14.
//  Copyright © 2017年 李超杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColor_Hex_color)

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;



@end
