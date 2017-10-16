//
//  UIFont+UIFont_MyFont.m
//  充电桩
//
//  Created by 李超杰 on 17/4/18.
//  Copyright © 2017年 李超杰. All rights reserved.
//

#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#import "UIFont+UIFont_MyFont.h"

@implementation UIFont (UIFont_MyFont)


+(UIFont *)SYSTEMFontOfSize:(CGFloat)fontSize{
    
    //我是根据屏幕尺寸判断的设备，然后字体设置为0.8倍
    
    if (kScreenHeight < 568) {
        
        fontSize = fontSize * 0.8;
        
    }
    
    UIFont *newFont = [ UIFont preferredFontForTextStyle : UIFontTextStyleBody ];
    
    UIFontDescriptor *ctfFont = newFont.fontDescriptor ;
    
    NSString *fontString = [ctfFont objectForKey : @"NSFontNameAttribute"];
    
    //使用 fontWithName 设置字体
    
    return [UIFont fontWithName:fontString size:fontSize];
    
}


@end
