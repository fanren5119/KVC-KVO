//
//  ViewController.m
//  KVCTest
//
//  Created by 王磊 on 16/2/18.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "CALayer+RuntimeAttribute.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    People *p = [[People alloc] init];
    p.name = @[@"wanglei", @"wanglei2", @"wanglei3", @"wanglei4", @"wanglei4"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
