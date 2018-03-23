//
//  ViewController.m
//  KVO--对象
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
    
//    [self.p addObserver:self forKeyPath:@"dog.name" options:(NSKeyValueObservingOptionNew) context:nil];
//    [self.p addObserver:self forKeyPath:@"dog.age" options:(NSKeyValueObservingOptionNew) context:nil];
    
    [self.p addObserver:self forKeyPath:@"dog" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", change);
}


- (IBAction)changeName:(id)sender
{
    static int a;
    self.p.dog.name = [NSString stringWithFormat:@"%d", a++];
}

- (IBAction)changeAge:(id)sender
{
    static int b;
    self.p.dog.age = b++;
}

@end
