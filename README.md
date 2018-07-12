# LandscapeDemo
横屏适配，针对个别VC适配横竖屏


##### 首先在 AppDelegate.m文件下添加以下方法：

```objc
#import "AppDelegate.h"
#import "SecondVC.h"

@implementation AppDelegate

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
    //所有控制器只允许竖屏
    return UIInterfaceOrientationMaskPortrait;
}
```

##### 然后在你需要横竖屏切换的类中添加以下方法：
```objc
#import "SecondVC.h"

@implementation SecondVC

//状态栏的显示和隐藏
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
@end
```

##### 并且在控制器中添加通知方法
```objc
- (void)viewDidLoad 
{
    [super viewDidLoad];
    //屏幕旋转通知
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) 
    name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)deviceOrientationDidChange
{
    NSLog(@"deviceOrientation --- %ld", (long)[UIDevice currentDevice].orientation);
    if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
    } 
    else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
    }
}
```

##### 记得在控制器移除时移除对应通知
```objc
- (void)dealloc
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}
```


