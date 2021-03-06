//
//  ViewController.m
//  LandscapeDemo
//
//  Created by do on 2018/7/4.
//  Copyright © 2018年 do. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ViewController.h"
#import "FirstVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.title = @"Root";
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake((self.view.frame.size.width - 100) / 2., (self.view.frame.size.height - 42) / 2., 100, 42);
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [pushBtn setTitle:@"跳转1" forState:UIControlStateNormal];
    [pushBtn setTitleColor:UIColorFromRGB(0x202020) forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushTo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)pushTo
{
    FirstVC *vc = [[FirstVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
