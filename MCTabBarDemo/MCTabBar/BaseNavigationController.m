//
//  BaseNavigationController.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/18.
//  Copyright © 2017年 Mr.C. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //可以设置一些样式
    /*
     //设置了NO之后View自动下沉navigationBar的高度
     self.navigationBar.translucent = NO;
     //改变左右Item的颜色
     self.navigationBar.tintColor = [UIColor whiteColor];
     
     //改变title的字体样式
     NSDictionary *textAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName: FONT_SYSTEM_BOLD(18)};
     [self.navigationBar setTitleTextAttributes:textAttributes];
     //改变navBar的背景颜色
     [self.navigationBar setBarTintColor:[UIColor blueColor]];
     */
}

//重写这个方法，在跳转后自动隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers count] > 0){
        viewController.hidesBottomBarWhenPushed = YES;
        //可以在这里定义返回按钮等
        /*
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        viewController.navigationItem.leftBarButtonItem = backItem;
         */
    }
    //一定要写在最后，要不然无效
    [super pushViewController:viewController animated:animated];
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
}


@end
