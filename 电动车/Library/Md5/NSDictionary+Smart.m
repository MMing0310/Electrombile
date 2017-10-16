//
//  NSDictionary+Smart.m
//  GiganticWhale
//
//  Created by GiganticWhale on 16/9/12.
//  Copyright © 2016年 Gigantic. All rights reserved.
//

#import "NSDictionary+Smart.h"

@implementation NSDictionary (Smart)

- (NSString *)mmh_JSONString
{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:0
                                                     error:&error];
    if (error) {
        NSLog(@"ERROR: cannot convert dictionary to JSON string: %@", self);
        return nil;
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
