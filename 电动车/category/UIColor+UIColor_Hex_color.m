//
//  UIColor+UIColor_Hex_color.m
//  充电桩
//
//  Created by 李超杰 on 17/4/14.
//  Copyright © 2017年 李超杰. All rights reserved.
//

#import "UIColor+UIColor_Hex_color.h"

@implementation UIColor (UIColor_Hex_color)


+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    //十进制
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b/ 255.0f) alpha:alpha];
     
     /*
    unsigned long red = strtoul([[cString substringWithRange:NSMakeRange(0, 2)] UTF8String],0, 16);
    unsigned long green = strtoul([[cString substringWithRange:NSMakeRange(2, 2)] UTF8String],0, 16);
    unsigned long blue = strtoul([[cString substringWithRange:NSMakeRange(4, 2)] UTF8String],0, 16);
    */
//     return [UIColor colorWithRed:rString green:gString blue:bString alpha:alpha];
    
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}


@end
