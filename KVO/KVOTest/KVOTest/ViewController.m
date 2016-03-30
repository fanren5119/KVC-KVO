//
//  ViewController.m
//  KVOTest
//
//  Created by 王磊 on 16/2/3.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (nonatomic, strong) People *people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.people = [[People alloc] initWithName:@"wanglei" age:24];
    [self.people addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (IBAction)respondsToButton:(id)sender
{
    self.people.age += 5;
}

- (IBAction)respondsToNameButton:(id)sender
{
    [self.people setUserName:@"wanglei"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"]) {
        self.ageLabel.text = [NSString stringWithFormat:@"%ld", (long)self.people.age];
        [self.people doSomething];
    }
    
    if ([keyPath isEqualToString:@"name"]) {
        self.nameLabel.text = [NSString stringWithFormat:@"%@", self.people.name];
        NSLog(@"=========");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
