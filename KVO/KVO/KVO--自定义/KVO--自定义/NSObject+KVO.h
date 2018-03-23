//
//  NSObject+KVO.h
//  KVO--自定义
//
//  Created by 王磊 on 2018/3/14.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)lw_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
