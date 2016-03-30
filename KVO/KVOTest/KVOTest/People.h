//
//  People.h
//  KVOTest
//
//  Created by 王磊 on 16/2/3.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (id)initWithName:(NSString *)name age:(NSInteger)age;

- (void)setUserName:(NSString *)name;

- (void)doSomething;

@end
