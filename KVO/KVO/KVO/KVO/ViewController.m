//
//  ViewController.m
//  KVO
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
//    [self.p addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    
    [self.p addObserver:self forKeyPath:@"age" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a;
//    self.p.name = [NSString stringWithFormat:@"%d", a++];
    
    //手动触发KVO观察
    [self.p willChangeValueForKey:@"age"];
    self.p.age = a ++;
    [self.p didChangeValueForKey:@"age"];
}


@end
