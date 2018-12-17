
# MCTabBarController
* 可以快速定制TabBar中间按钮
* 详细介绍可参考 [简书](https://www.jianshu.com/p/5160a1b48679)

# 添加 MCTabBarController 到你的项目
### CocoaPods 
推荐 [CocoaPods](https://cocoapods.org) 
 "MCTabBarController.h".
* **Object-C** 
> pod 'MCTabBarController'
* **Swift** 
> pod 'MCTabBarControllerSwift'

### 资源文件导入
* 1、下载最新的项目版本，将文件夹MCTabBarController导入到你的项目中.
* 2、在需要使用的地方 #import "MCTabBarController.h".

# 版本要求
* Xcode 8 及以上版本
* iOS 8.0 及以上版本

# 效果图
![效果图](https://github.com/Ccalary/MCTabBarController/blob/master/ScreenShot/tabbar.gif)

# 使用简介
创建你自己的XXTabBarController类继承直 MCTabBarController
```
#import "MCTabBarController.h"

@interface NormalTabBarController : MCTabBarController

@end

```
```
@interface NormalTabBarController ()

@end

@implementation NormalTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //选中时的颜色
//    self.mcTabbar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.mcTabbar.translucent = NO;
    self.mcTabbar.centerImage = [UIImage imageNamed:@"tab_unselect_gray"];
    self.mcTabbar.centerSelectedImage = [UIImage imageNamed:@"tab_select_blue"];
    // 可设置宽高
//    self.mcTabbar.centerWidth = 40;
//    self.mcTabbar.centerHeight = 40;
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"首页" andImageName:@"tab1"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"" andImageName:@""];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"发现" andImageName:@"tab3"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    // 选中的颜色由tabbar的tintColor决定
    childVC.tabBarItem.selectedImage =  [UIImage imageNamed:imageName];
    childVC.title = title;
    
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}

//... something


```

# 开源协议
This code is distributed under the terms and conditions of the MIT license.

# 联系我
如果你发现bug，please pull reqeust me，如果你觉得对你有所帮助，请给个star吧🌟。
