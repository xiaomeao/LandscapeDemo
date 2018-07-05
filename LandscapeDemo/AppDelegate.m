//
//  AppDelegate.m
//  LandscapeDemo
//
//  Created by do on 2018/7/4.
//  Copyright © 2018年 do. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    //Step 1
    //由一个导航控制器管理视图
    if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
        if ([nav.topViewController isKindOfClass:[SecondVC class]]) {
            //由子视图去管理自己的方向
            return [nav.topViewController supportedInterfaceOrientations];
        }
    }
    
    //Step 2
    //由UITabBarController 管理多个视图
//    if ([self.window.rootViewController isKindOfClass:[UITabBarController class]]) {
//        UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
//        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]]) {
//            UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
//            if ([nav.topViewController isKindOfClass:[SecondVC class]]) {
//                //由子视图去管理自己的方向
//                return [nav.topViewController supportedInterfaceOrientations];
//            }
//        }
//    }
    
    //所有控制器只允许竖屏
    return UIInterfaceOrientationMaskPortrait;
}

@end
