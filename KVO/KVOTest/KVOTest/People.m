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


/**
 *  此方法用来设置key对应的属性是自动通知，还是手动通知
 *
 *  @param key 属性的key值
 *
 *  @return 返回NO表示此属性只能手动通知观察者，返回YES表示可以自动通知观察者
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    BOOL automation = [super automaticallyNotifiesObserversForKey:key];
    return automation;
}

@end
