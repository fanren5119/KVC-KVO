//
//  ViewController.m
//  KVCTest
//
//  Created by 王磊 on 16/2/18.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "People.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setOperationKVC];
}

/**
 *  KVC的基本用法
 */
- (void)simpleKVC
{
    People *people = [[People alloc] init];
//    [people setValue:@"xiaoming" forKey:@"name"];
//    [people setValue:@15 forKey:@"age"];
//    
//    NSString *name = [people valueForKey:@"name"];
//    NSNumber *age  = [people valueForKey:@"age"];
    
    
    [people setValue:@"xiaoming" forKeyPath:@"name"];
    [people setValue:@15 forKeyPath:@"age"];
    
    NSString *name = [people valueForKeyPath:@"name"];
    NSNumber *age  = [people valueForKeyPath:@"age"];
    
    NSLog(@"name: %@ age: %@", name, age);
    
    [people setValue:@"xiaohua" forKey:@"friend"];
    NSString *friend = [people valueForKey:@"friend"];
    NSLog(@"%@", friend);
}

/**
 *  使用keyPath，实现KVC
 */
- (void)keyPathKVC
{
    People *people = [[People alloc] init];
    people.wife = [[Wife alloc] init];
    
    [people setValue:@"小明" forKeyPath:@"name"];
    [people setValue:@"小花" forKeyPath:@"wife.name"];
    
    NSString *name = [people valueForKeyPath:@"name"];
    NSString *wifeName = [people valueForKeyPath:@"wife.name"];
    NSLog(@"name: %@, wife: %@", name, wifeName);
}


/**
 *  一对多关系中的集合器访问方法
 */
- (void)oneToMoreKVC
{
    People *people = [[People alloc] init];
    
//    [people insertObject:@"xiaoming" inFriendsNameAtIndex:0];
//    [people insertFriendsName:@[@"xiaohua", @"xiaobai"] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)]];
    
    people.friendsName = @[@"xiaoming", @"xiaohua"];
//    [people removeFriendsNameAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)]];
//    [people removeObjectFromFriendsNameAtIndex:1];
    
//    [people replaceObjectInFriendsNameAtIndex:0 withObject:@"xiaobai"];
//    [people replaceFriendsNameAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withFriendsName:@[@"xiaohei", @"xiaobai"]];
    
//    NSLog(@"%@", [people friendsNameAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)]]);
//    NSLog(@"%@", [people objectInFriendsNameAtIndex:0]);
    
    NSLog(@"%@", people.friendsName);
    NSLog(@"%ld", (long)people.countOfFriendsName);
}


/**
 *  集合运算符中的简单运算符
 */
- (void)simpleOperationKVC
{
    People *people1 = [[People alloc] initWithFirstName:@"xiaoming" lastName:@"wang" age:15];
    People *people2 = [[People alloc] initWithFirstName:@"xiaohua" lastName:@"wang" age:21];
    People *people3 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"wang" age:18];
    
    NSArray *peopleArray = @[people1, people2, people3];
    
    NSNumber *average = [peopleArray valueForKeyPath:@"@avg.age"];
    NSLog(@"average: %@", average);
    
    NSNumber *max = [peopleArray valueForKeyPath:@"@max.age"];
    NSLog(@"max: %@", max);
    
    NSNumber *min = [peopleArray valueForKeyPath:@"@min.age"];
    NSLog(@"min: %@", min);
    
    NSNumber *sum = [peopleArray valueForKeyPath:@"@sum.age"];
    NSLog(@"sum: %@", sum);
    
    NSLog(@"%@", [peopleArray valueForKeyPath:@"@count"]);
}

/**
 *  对象运算符
 */
- (void)objectsOperationKVC
{
    People *people1 = [[People alloc] initWithFirstName:@"xiaoming" lastName:@"li" age:15];
    People *people2 = [[People alloc] initWithFirstName:@"xiaohua" lastName:@"wang" age:21];
    People *people3 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"wang" age:18];
    
    NSArray *peopleArray = @[people1, people2, people3];
    NSArray *dUnionLastNames = [peopleArray valueForKeyPath:@"@distinctUnionOfObjects.lastName"];
    NSLog(@"%@", dUnionLastNames);
    
    NSArray *unionLastNames = [peopleArray valueForKeyPath:@"@unionOfObjects.lastName"];
    NSLog(@"%@", unionLastNames);
}


/**
 *  array操作符
 */
- (void)arrayOperationKVC
{
    People *people1 = [[People alloc] initWithFirstName:@"xiaoming" lastName:@"li" age:15];
    People *people2 = [[People alloc] initWithFirstName:@"xiaohua" lastName:@"wang" age:21];
    People *people3 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"wang" age:18];
    NSArray *peopleArray = @[people1, people2, people3];
    
    People *people4 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"li" age:15];
    People *people5 = [[People alloc] initWithFirstName:@"xiaohei" lastName:@"zhao" age:21];
    People *people6 = [[People alloc] initWithFirstName:@"xiaohong" lastName:@"wang" age:18];
    NSArray *peopleArray2 = @[people4, people5, people6];
    
    NSArray *arrayOfArray = @[peopleArray, peopleArray2];
    NSArray *dUnionLastName = [arrayOfArray valueForKeyPath:@"@distinctUnionOfArrays.lastName"];
    NSLog(@"dUnionLastName: %@", dUnionLastName);
    
    NSArray *unionLastName = [arrayOfArray valueForKeyPath:@"@unionOfArrays.lastName"];
    NSLog(@"unionLastName: %@", unionLastName);
}


/**
 *  集合操作符
 */
- (void)setOperationKVC
{
    People *people1 = [[People alloc] initWithFirstName:@"xiaoming" lastName:@"li" age:15];
    People *people2 = [[People alloc] initWithFirstName:@"xiaohua" lastName:@"wang" age:21];
    People *people3 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"wang" age:18];
    NSSet *peopleSet = [NSSet setWithObjects:people1, people2, people3, nil];
    
    People *people4 = [[People alloc] initWithFirstName:@"xiaobai" lastName:@"li" age:15];
    People *people5 = [[People alloc] initWithFirstName:@"xiaohei" lastName:@"zhao" age:21];
    People *people6 = [[People alloc] initWithFirstName:@"xiaohong" lastName:@"wang" age:18];
    NSSet *peopleSet2 = [NSSet setWithObjects:people4, people5, people6, nil];
    
    NSSet *setOfSet = [NSSet setWithObjects:peopleSet, peopleSet2, nil];
    NSArray *dUnionLastName = [setOfSet valueForKeyPath:@"@distinctUnionOfSets.lastName"];
    NSLog(@"dUnionLastName: %@", dUnionLastName);
}


@end
