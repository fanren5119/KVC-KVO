//
//  People.m
//  KVOTest
//
//  Created by 王磊 on 16/2/3.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>

@implementation People

- (id)initWithName:(NSString *)name age:(NSInteger)age
{
    if (self = [super init]) {
        _name = name;
        _age = age;
        [self doSomething];
    }
    return self;
}

- (void)setUserName:(NSString *)name
{
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

- (void)doSomething
{
    NSLog(@"======%ld", (long)self.age);
    NSLog(@"self.isa===%@", object_getClass(self));
    NSLog(@"self class === %@", [self class]);
}


+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

@end
