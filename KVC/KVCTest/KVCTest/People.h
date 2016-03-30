//
//  People.h
//  KVCTest
//
//  Created by 王磊 on 16/3/30.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wife.h"
#import <Foundation/NSObject.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSRange.h>
#import <Foundation/NSObjCRuntime.h>


@interface People : NSObject

@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *lastName;
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) NSArray   *friendsName;
@property (nonatomic, strong) Wife      *wife;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;

- (NSInteger)countOfFriendsName;
- (id)objectInFriendsNameAtIndex:(NSUInteger)index;
- (NSArray *)friendsNameAtIndexes:(NSIndexSet *)indexes;
- (void)getFriendsName:(NSString *__unsafe_unretained [])buffer range:(NSRange)inRange;
- (void)insertFriendsName:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(NSString *)object inFriendsNameAtIndex:(NSUInteger)index;
- (void)removeObjectFromFriendsNameAtIndex:(NSUInteger)index;
- (void)removeFriendsNameAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFriendsNameAtIndex:(NSUInteger)index withObject:(id)object;
- (void)replaceFriendsNameAtIndexes:(NSIndexSet *)indexes withFriendsName:(NSArray *)array;

@end
