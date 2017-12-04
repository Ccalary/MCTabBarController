//
//  MCTabBarController.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 Mr.C. All rights reserved.
//

#import "MCTabBarController.h"
#import "ViewController.h"

@interface MCTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UIButton *button;
@end

@implementation MCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBar *tabbar = [UITabBar appearance];
    tabbar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];//选中时的颜色
    //设置为NO后则没有透明度添加(tabbar为白色)
    tabbar.translucent = NO;
    self.delegate = self;
    [self addChildViewControllers];
    [self setUpButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"首页" andImageName:@"tab1_n" andSelectImage:@"tab1_p"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"扩展" andImageName:@"tab2_n" andSelectImage:@"tab2_p"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"旋转" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"发现" andImageName:@"tab3_n" andSelectImage:@"tab3_p"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"我" andImageName:@"tab4_n" andSelectImage:@"tab4_p"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImage];
    childVC.title = title;
    
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:baseNav];
}

//中间按钮布局
- (void)setUpButton{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    //  设定button大小为适应图片
    UIImage *normalImage = [UIImage imageNamed:@"tabbar_add"];
    _button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [_button setImage:normalImage forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //去除选择时高亮
    _button.adjustsImageWhenHighlighted = NO;
    //根据图片调整button的位置
    CGPoint center = self.tabBar.center;
    center.y = self.tabBar.frame.origin.y + 5;//中心为tabbar顶部
    _button.center = center;
    [self.view addSubview:_button];
}

- (void)buttonAction:(UIButton *)button{
    self.selectedIndex = 2;//关联中间按钮
    [self rotationAnimation];
}

//tabbar选择时的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 2){//选中中间的按钮
        [self rotationAnimation];
    }else {
        [_button.layer removeAllAnimations];
    }
}
//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [_button.layer addAnimation:rotationAnimation forKey:@"key"];
}

@end
