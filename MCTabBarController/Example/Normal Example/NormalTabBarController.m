//
//  NormalTabBarController.m
//  MCTabBarController
//
//  Created by caohouhong on 2018/12/7.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "NormalTabBarController.h"
#import "ViewController.h"
#import "BaseNavigationController.h"

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
    
    // 默认选中中间按钮
    self.selectedIndex = 1;
    self.mcTabbar.centerBtn.selected = YES;
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

@end
