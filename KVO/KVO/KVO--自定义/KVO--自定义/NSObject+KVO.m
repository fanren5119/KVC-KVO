//
//  NSObject+KVO.m
//  KVO--自定义
//
//  Created by 王磊 on 2018/3/14.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

@implementation NSObject (KVO)

- (void)lw_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    
    //1.动态创建person子类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"LW_" stringByAppendingString:oldClassName];
    Class newClass = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
    objc_registerClassPair(newClass);
    
    //2.重写setName方法，在内部恢复父类的做法
    class_addMethod(newClass, @selector(setNewName), (IMP)setNewName, "");
    
    //3.动态修改对象的类型，使其变为子类类型
    object_setClass(self, newClass);
}

void setNewName(id self, SEL _cmd, NSString *newName) {
    NSLog(@"==%@", newName);
    
//    Class superClass = [self superclass];
//    object_setClass(self, superClass);
    
    [self willChangeValueForKey:@"name"];
    [self setName:newName];
    [self didChangeValueForKey:@"name"];
}

@end
