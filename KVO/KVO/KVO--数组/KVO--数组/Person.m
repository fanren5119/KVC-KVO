//
//  Person.m
//  KVO--数组
//
//  Created by 王磊 on 2018/3/14.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
    }
    return self;
}

@end
