# LandscapeDemo
横屏适配，针对个别VC适配横竖屏


##### 首先在 AppDelegate.m文件下添加以下方法：
![](https://github.com/xiaomeao/LandscapeDemo/raw/master/READMEIMG/twoImg.png)

##### 然后在你需要横竖屏切换的类中添加以下方法：
![](https://github.com/xiaomeao/LandscapeDemo/raw/master/READMEIMG/threeImg.png)

##### 并且在控制器中添加通知方法
![](https://github.com/xiaomeao/LandscapeDemo/raw/master/READMEIMG/fourImg.png)

##### 记得在控制器移除时移除对应通知
[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications]



