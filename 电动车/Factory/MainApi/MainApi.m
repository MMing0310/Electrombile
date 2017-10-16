//
//  MainApi.m
//  CarSticker
//
//  Created by cc on 2017/3/29.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "MainApi.h"
#import <AFNetworking.h>
#import "DicToString.h"
#if UDID
#import "KeychainUUID.h"
#else
#endif

@interface MainApi ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

static MainApi *request = nil;

@implementation MainApi


+ (MainApi *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[MainApi alloc] init];
    });
    return request;
}

- (instancetype)init {
    if (self == [super init]) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
        [self.manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
    }
    return self;
}

- (void)getPath:(NSString *)path params:(NSDictionary *)params resultBlock:(ResultBlock)resultBlock {
    return [self dataTaskWithHTTPMethod:@"GET" URLString:path parameters:params  resultBlock:resultBlock];
}

- (void)postPath:(NSString *)path params:(NSDictionary *)params resultBlock:(ResultBlock)resultBlock {
    return [self dataTaskWithHTTPMethod:@"POST" URLString:path parameters:params  resultBlock:resultBlock];
}

- (void)dataTaskWithHTTPMethod:(NSString *)method
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
                   resultBlock:(ResultBlock)resultBlock {
    

    NSMutableDictionary *mutArr = [NSMutableDictionary dictionaryWithDictionary:parameters];
        [mutArr addEntriesFromDictionary:@{@"apiCode":URLString}];
        if ([ConfigModel getBoolObjectforKey:IsLogin]) {
            NSString *usertoken = [ConfigModel getStringforKey:UserToken];
            [mutArr addEntriesFromDictionary:@{@"userToken":usertoken}];
#if UDID
            KeychainUUID *keychain = [[KeychainUUID alloc] init];
            id data = [keychain readUDID];
            NSString *udidStr = data;
            [mutArr addEntriesFromDictionary:@{@"device_number":udidStr}];
#else
#endif
            
        }
        NSString *jsStr = [DicToString parametersString:mutArr];
        NSDictionary *jsDic = @{@"json" : jsStr};
    
    
    if ([method isEqualToString:@"POST"]) {
        
        NSLog(@"22%@==============",jsDic);
        
        [self.manager POST:BaseApi parameters:jsDic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Response Object:\n%@", responseObject);
            if (resultBlock) {
                resultBlock(responseObject, nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (resultBlock) {
                NSLog(@"Response Object:\n%@", error);
                resultBlock(nil, error);
            }
        }];
    }else if([method isEqualToString:@"GET"]){
        [self.manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Response Object:\n%@", responseObject);
            if (resultBlock) {
                resultBlock(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (resultBlock) {
                resultBlock(nil, error);
            }
        }];
    }
       NSLog(@"33%@==============",URLString);
    
}




@end
