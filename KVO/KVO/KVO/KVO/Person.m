//
//  Person.m
//  KVO
//
//  Created by 王磊 on 2018/3/14.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "Person.h"

@implementation Person

//返回NO，手动触发KVO键值观察
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"age"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

@end
