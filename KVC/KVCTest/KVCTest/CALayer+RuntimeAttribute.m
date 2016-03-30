//
//  CALayer+RuntimeAttribute.m
//  KVCTest
//
//  Created by 王磊 on 16/2/23.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "CALayer+RuntimeAttribute.h"

@implementation CALayer (RuntimeAttribute)

- (void)setBorderIBColor:(UIColor *)borderIBColor
{
    self.borderColor = borderIBColor.CGColor;
}

- (UIColor *)borderIBColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
