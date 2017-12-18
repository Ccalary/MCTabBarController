//
//  ViewController.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *randomColor = [UIColor colorWithRed:(arc4random()%255)*1.0f/255.0
                                                  green:(arc4random()%255)*1.0f/255.0
                                                   blue:(arc4random()%255)*1.0f/255.0 alpha:0.6];
    self.view.backgroundColor = randomColor;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 80)];
    btn.center = self.view.center;
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    btn.layer.cornerRadius = 4.0;
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction{
    
    [self.navigationController pushViewController:[[PushViewController alloc] init] animated:YES];
   
}
@end
