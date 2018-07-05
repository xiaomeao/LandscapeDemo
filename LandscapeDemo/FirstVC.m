//
//  FirstVC.m
//  LandscapeDemo
//
//  Created by do on 2018/7/4.
//  Copyright © 2018年 do. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "FirstVC.h"
#import "SecondVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.title = @"First";
    self.view.backgroundColor = UIColorFromRGB(0xFDD555);\
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake((self.view.frame.size.width - 100) / 2., (self.view.frame.size.height - 42) / 2., 100, 42);
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [pushBtn setTitle:@"跳转2" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushTo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)pushTo
{
    SecondVC *vc = [[SecondVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
