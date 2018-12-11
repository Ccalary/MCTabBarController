
# MCTabBarController
* A easy way to customize your tabBarController
* Detail [简书](https://www.jianshu.com/p/5160a1b48679)

# Adding MCTabBarController to your project
### CocoaPods 
[CocoaPods](https://cocoapods.org) is the recommended way to add MCTabBarController to your project.
* 1、Add a pod entry for MCTabBarController to your Podfile pod 'MCTabBarController'
* 2、Install the pod(s) by running pod install.
* 3、Include MCTabBarController wherever you need it with #import "MCTabBarController.h".

### Source files
Alternatively you can directly add the folder MCTabBarController files to your project.
* 1、Download the latest code version or add the repository as a git submodule to your git-tracked project.
* 2、Open your project in Xcode, then drag and drop folder MCTabBarController onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
* 3、Include MCTabBarController wherever you need it with #import "MCTabBarController.h".

# Requirements
* Xcode 8 or higher
* iOS 8.0 or higher

# ScreenShot
![screenShot](https://github.com/Ccalary/MCTabBarController/blob/master/src/tabbar.gif)

# Usage
Create your class inherits from the class MCTabBarController
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

# License
This code is distributed under the terms and conditions of the MIT license.

# Contact 
如果你发现bug，please pull reqeust me，如果你觉得对你有所帮助，请给个star吧🌟。
