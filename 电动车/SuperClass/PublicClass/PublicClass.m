//
//  PublicClass.m
//  BaseProject
//
//  Created by lxl on 2017/6/29.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "PublicClass.h"

@implementation PublicClass
+ (UIButton *)setRightTitleOnTargetNav:(id)controller action:(SEL)action Title:(NSString *)title{
    //设置navbar上的右键按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC" size:14];
    [rightBtn sizeToFit];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [[controller navigationItem] setRightBarButtonItem:backItem];
    return rightBtn;
}
+ (UIButton *)setLeftButtonItemOnTargetNav:(id)controller action:(SEL)action image:(UIImage *)image Title:(NSString *)title {
    //设置navbar上的左键按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:image forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    rightBtn.adjustsImageWhenHighlighted = NO;
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC" size:14];
    [rightBtn sizeToFit];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [[controller navigationItem] setLeftBarButtonItem:backItem];
    return rightBtn;
}
//+ (UIButton *)setLeftTitleOnTargetNav:(id)controller action:(SEL)action Title:(NSString *)title{
//    //设置navbar上的左键按钮
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
//    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [rightBtn setTitle:title forState:UIControlStateNormal];
//    rightBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC" size:14];
//    [rightBtn sizeToFit];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    [[controller navigationItem] setLeftBarButtonItem:backItem];
//    return rightBtn;
//}

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
//中间文字
+ (UILabel *)seTitleViewOnTargetNav:(id)controller UIFont:(UIFont *)font title:(NSString *)title textColor:(UIColor *)color{
    UILabel * lab = [[UILabel alloc]init];
    lab.text = title;
    lab.textColor = color;
    lab.font = font;
    [lab sizeToFit];
    [[controller navigationItem] setTitleView:lab];
    return lab;
}
+(BOOL)firstColor:(UIColor*)firstColor secondColor:(UIColor*)secondColor
{
    if (CGColorEqualToColor(firstColor.CGColor, secondColor.CGColor))
    {
        NSLog(@"颜色相同");
        return YES;
    }
    else
    {
        NSLog(@"颜色不同");
        return NO;
    }
}
@end
