//
//  DicToString.m
//  CarSticker
//
//  Created by cc on 2017/3/30.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "DicToString.h"
#import "NSString+MD5.h"
#import "NSDictionary+Smart.h"
@implementation DicToString

+ (NSString *)parametersString:(NSDictionary *)parameters {
    NSMutableDictionary *mutableParameters = [parameters mutableCopy];
    //    NSString *apiCode = [mutableParameters objectForKey:@"apiCode"];
    //    [mutableParameters removeObjectForKey:@"apiCode"];
    NSArray *tempKeys = [mutableParameters allKeys];
    
    
    
    NSArray *sortedKeys = [tempKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *key1 = (NSString *)obj1;
        NSString *key2 = (NSString *)obj2;
        return [key1 compare:key2];
    }];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    //    [tempArr addObject:@"apiCode"];
    [tempArr addObjectsFromArray:sortedKeys];
    //    [mutableParameters setObject:apiCode forKey:@"apiCode"];
    
    NSString *token = @"";
    for (NSString *key in tempArr) {
        NSString *value = [NSString stringWithFormat:@"%@", parameters[key]];
        token = [token stringByAppendingString:value];
    }
    token = [token stringByAppendingString:@"1e56c95504a9a846e4c7043704a20f25"];
    token = [token md5String];
    
    
    [mutableParameters addEntriesFromDictionary:@{@"token": token}];
    return [mutableParameters mmh_JSONString];
}

@end
