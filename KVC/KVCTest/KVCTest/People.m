//
//  People.m
//  KVCTest
//
//  Created by 王磊 on 16/3/30.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "People.h"

@interface People ()

@property (nonatomic, strong) NSMutableArray *friendsNameArray;

@end

@implementation People

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"value:%@ key: %@", value, key);
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"key:%@", key);
    return nil;
}

- (void)setFriendsName:(NSArray *)friendsName
{
    self.friendsNameArray = friendsName.mutableCopy;
}

- (NSArray *)friendsName
{
    return self.friendsNameArray.copy;
}


- (NSInteger)countOfFriendsName
{
    return self.friendsNameArray.count;
}

- (id)objectInFriendsNameAtIndex:(NSUInteger)index
{
    return self.friendsNameArray[index];
}

- (void)getFriendsName:(NSString *__unsafe_unretained [])buffer range:(NSRange)inRange
{
    [self.friendsNameArray getObjects:buffer range:inRange];
}

- (NSArray *)friendsNameAtIndexes:(NSIndexSet *)indexes
{
    return [self.friendsNameArray objectsAtIndexes:indexes];
}

- (void)insertFriendsName:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
    [self.friendsNameArray insertObjects:array atIndexes:indexes];
}

- (void)insertObject:(id)object inFriendsNameAtIndex:(NSUInteger)index
{
    [self.friendsNameArray insertObject:object atIndex:index];
}

- (void)removeObjectFromFriendsNameAtIndex:(NSUInteger)index
{
    [self.friendsNameArray removeObjectAtIndex:index];
}
- (void)removeFriendsNameAtIndexes:(NSIndexSet *)indexes
{
    [self.friendsNameArray removeObjectsAtIndexes:indexes];
}
- (void)replaceObjectInFriendsNameAtIndex:(NSUInteger)index withObject:(id)object
{
    [self.friendsNameArray replaceObjectAtIndex:index withObject:object];
}
- (void)replaceFriendsNameAtIndexes:(NSIndexSet *)indexes withFriendsName:(NSArray *)array
{
    [self.friendsNameArray replaceObjectsAtIndexes:indexes withObjects:array];
}


- (NSMutableArray *)friendsNameArray
{
    if (_friendsNameArray == nil) {
        _friendsNameArray = [NSMutableArray array];
    }
    return _friendsNameArray;
}

@end
