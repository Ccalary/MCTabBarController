//
//  MCTabBarController.h
//  MCTabBarController
//
//  Created by caohouhong on 2018/12/7.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCTabBar.h"
@protocol MCTabBarControllerDelegate<UITabBarControllerDelegate>
// 重写了选中方法，主要处理中间item选中事件
- (void)mcTabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end
@interface MCTabBarController : UITabBarController
@property (nonatomic, weak) id<MCTabBarControllerDelegate> mcDelegate;
@property (nonatomic, strong) MCTabBar *mcTabbar;
@end
