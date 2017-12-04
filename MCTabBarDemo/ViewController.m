//
//  ViewController.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *randomColor = [UIColor colorWithRed:(arc4random()%255)*1.0f/255.0
                                                  green:(arc4random()%255)*1.0f/255.0
                                                   blue:(arc4random()%255)*1.0f/255.0 alpha:0.6];
    self.view.backgroundColor = randomColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
