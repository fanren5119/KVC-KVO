//
//  ViewController.m
//  KVO--数组
//
//  Created by 王磊 on 2018/3/14.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.p = [[Person alloc] init];
    
    [self.p addObserver:self forKeyPath:@"array" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", change);
    /*
     {
     indexes = "<_NSCachedIndexSet: 0x60c00003c240>";
     kind = 2; //这里的kind是枚举NSKeyValueChange的值
     new =     (
         0
     );
     }
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a;
    NSMutableArray *array = [self.p mutableArrayValueForKey:@"array"];
    //此方法中，创建一个NSMutableArray的子类NSKeyValueNotifyingMutableArray,并重写addObject方法，在addObejct方法中，发起KVO键值观察
    NSString *value = [NSString stringWithFormat:@"%d", a];
    [array addObject:value];
}



@end
