//
//  MainApi.h
//  CarSticker
//
//  Created by cc on 2017/3/29.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResultBlock)(id responseObject, NSError *error);

#define HttpRequest [MainApi sharedInstance]

@interface MainApi : NSObject

+ (MainApi *)sharedInstance;

/**
 *  发送post请求
 *
 *  @param path  请求的网址字符串
 *  @param params 请求的参数
 *  @param resultBlock    请求成功的回调
 */

- (void)getPath:(NSString *)path params:(NSDictionary *)params resultBlock:(ResultBlock)resultBlock;

/**
 *  发送post请求
 *
 *  @param path  请求的网址字符串
 *  @param params 请求的参数
 *  @param resultBlock    请求成功的回调
 */

- (void)postPath:(NSString *)path params:(NSDictionary *)params resultBlock:(ResultBlock)resultBlock;




@end
