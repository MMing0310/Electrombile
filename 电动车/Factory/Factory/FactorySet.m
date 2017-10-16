//
//  FactorySet.m
//  BaseProject
//
//  Created by cc on 2017/6/22.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "FactorySet.h"
#define Theme_Color_Pink RGB(255,83,123)
#define RGB(r,g,b)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define Nav_Back_Font_M [UIFont systemFontOfSize:14]
@implementation FactorySet

+ (UIImage *)patternImageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1.0f, 1.0f), NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color set];
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIBarButtonItem*)createBackBarButtonItemWithTarget:(id)target action:(SEL)action{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 25, 25);
    leftButton.titleLabel.font = Nav_Back_Font_M;
    //    [leftButton setTitleColor:Theme_Color_Pink forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = NO;
    
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    /*
     [leftButton setTitle:@"返回" forState:UIControlStateNormal];
     [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -2, 0, leftButton.titleLabel.bounds.size.width)];
     */
    //    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];//zhj 2016.3.13
    
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    return leftBtn;
}

+ (UIBarButtonItem*)createCloseBarButtonItemWithTarget:(id)target action:(SEL)action{
    UIButton *leftButton = [[UIButton alloc]init];
    leftButton.frame = CGRectMake(0, 0, 40, 45);
    leftButton.titleLabel.font = Nav_Back_Font_M;
    [leftButton setTitleColor:Theme_Color_Pink forState:UIControlStateNormal];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = NO;
    
    [leftButton setImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -2, 0, leftButton.titleLabel.bounds.size.width)];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    return leftBtn;
}


+ (UIBarButtonItem*)createBarButtonItemWithTitle2:(NSString*)title addTarget:(id)target action:(SEL)action{
    
    UIButton *leftButton = [[UIButton alloc]init];
    leftButton.frame = CGRectMake(0, 0, 72, 45);
    leftButton.titleLabel.font = Nav_Back_Font_M;
    //    [leftButton setTitleColor:Nav_BAR_ITEM_COLOR forState:UIControlStateNormal];
    [leftButton setTitle:title forState:UIControlStateNormal];
    leftButton.adjustsImageWhenDisabled = NO;
    
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    return leftBtn;
}

+ (UITabBarItem*) createTabbarItem:(NSString*)title withImage:(NSString*)unimg withHeightLightImage:(NSString*)highImg
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:unimg] selectedImage:[UIImage imageNamed:highImg]];
    item.tag = 0;
    UIImage* image = [UIImage imageNamed: highImg];
    if ([image respondsToSelector: @selector(imageWithRenderingMode:)])
        [item setSelectedImage: [image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    
    
    item.imageInsets  = UIEdgeInsetsMake(6, 0, -6, 0);
    
    return item;
}


@end
