//
//  NSString+MD5.m
//  PocketKitchen
//
//  Created by DancewithPeng on 15/7/9.
//  Copyright (c) 2015年 dancewithpeng@gmail.com. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)

//- (NSString *)md5String
//{
//    const char *cStr = [self UTF8String];
//    unsigned char buff[16];
//    CC_MD5(cStr, (CC_LONG)strlen(cStr), buff);
//    
//    NSMutableString *result = [[NSMutableString alloc] init];
//    for (int i=0; i<16; i++) {
//        [result appendFormat:@"%02x", buff[i]];
//    }
//    
//    return result;
//}

- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)(strlen(cStr)), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
