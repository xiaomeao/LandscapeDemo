//
//  SecondVC.m
//  LandscapeDemo
//
//  Created by do on 2018/7/4.
//  Copyright © 2018年 do. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "SecondVC.h"

@interface SecondVC ()
@property (nonatomic, strong) UILabel *labelChange;
@property (nonatomic, strong) UIButton *cancelChange;
@end

@implementation SecondVC

- (void)dealloc
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

- (BOOL)prefersStatusBarHidden
{
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
        //横屏时隐藏状态栏
        return YES;
    }
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    // 支持横竖屏切换
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation 
{
    // 默认竖屏
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //重新设置self.view里面的内容frame
    _labelChange.frame = CGRectMake((self.view.frame.size.width - 100) / 2., (self.view.frame.size.height - 42) / 2., 100, 42);
    _cancelChange.frame = CGRectMake(_labelChange.frame.origin.x, CGRectGetMaxY(_labelChange.frame) + 50, 100, 42);
}

- (void)viewWillDisappear:(BOOL)animated
{
    //界面将要消息强制取消横屏
    [self cancelAction];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.title = @"Second";
    self.view.backgroundColor = UIColorFromRGB(0x24B4EE);
    
    //屏幕旋转通知
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    _labelChange = [[UILabel alloc] init];
    _labelChange.frame = CGRectMake((self.view.frame.size.width - 100) / 2., (self.view.frame.size.height - 42) / 2., 100, 42);
    _labelChange.textAlignment = NSTextAlignmentCenter;
    _labelChange.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    _labelChange.text = @"中间文本";
    _labelChange.textColor = [UIColor blackColor];
    [self.view addSubview:_labelChange];
    
    _cancelChange = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelChange.frame = CGRectMake(_labelChange.frame.origin.x, CGRectGetMaxY(_labelChange.frame) + 50, 100, 42);
    _cancelChange.titleLabel.font = [UIFont systemFontOfSize:16];
    [_cancelChange setTitle:@"取消横屏" forState:UIControlStateNormal];
    [_cancelChange addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelChange];
}

#pragma mark 取消横屏
- (void)cancelAction
{
    //设置屏幕的转向为竖屏
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    [UIViewController attemptRotationToDeviceOrientation];
}

#pragma mark 横竖屏切换通知
- (void)deviceOrientationDidChange
{
    NSLog(@"deviceOrientation --- %ld", (long)[UIDevice currentDevice].orientation);
    if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
        [self changePopGestureRecognizer:YES];
    } 
    else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
        [self changePopGestureRecognizer:NO];
    }
}

#pragma mark 是否开启或关闭手势滑动返回
- (void)changePopGestureRecognizer:(BOOL)isChange
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {  
        self.navigationController.interactivePopGestureRecognizer.enabled = isChange;  
    } 
}

@end
