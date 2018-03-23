//
//  Person.m
//  KVO--对象
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
        self.dog = [[Dog alloc] init];
    }
    return self;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet *set = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        NSArray *keysArr = @[@"_dog.name", @"_dog.age"];
        set = [set setByAddingObjectsFromArray:keysArr];
    }
    return set;
}

@end
