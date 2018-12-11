//
//  MCTabBar.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/18.
//  Copyright © 2017年 Mr.C. All rights reserved.
//  github:https://github.com/Ccalary/MCTabBarController

#import "MCTabBar.h"

#define MCTabBarItemHeight    49.0f

@interface MCTabBar()
@end
@implementation MCTabBar
- (instancetype)init{
    if (self = [super init]){
        [self initView];
    }
    return self;
}

- (void)initView{
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //去除选择时高亮
    _centerBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:_centerBtn];
}

// 设置layout
- (void)layoutSubviews {
    [super layoutSubviews];
    switch (self.position) {
        case MCTabBarCenterButtonPositionCenter:
            _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2.0, (MCTabBarItemHeight - _centerHeight)/2.0 + self.centerOffsetY, _centerWidth, _centerHeight);
            break;
        case MCTabBarCenterButtonPositionBulge:
             _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2.0, -_centerHeight/2.0 + self.centerOffsetY, _centerWidth, _centerHeight);
            break;
        default:
            break;
    }
}

- (void)setCenterImage:(UIImage *)centerImage {
    _centerImage = centerImage;
    // 如果设置了宽高则使用设置的大小
    if (self.centerWidth <= 0 && self.centerHeight <= 0){
        //根据图片调整button的位置(默认居中，如果图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
        _centerWidth = centerImage.size.width;
        _centerHeight = centerImage.size.height;
    }
    [_centerBtn setImage:centerImage forState:UIControlStateNormal];
}

- (void)setCenterSelectedImage:(UIImage *)centerSelectedImage {
    _centerSelectedImage = centerSelectedImage;
    [_centerBtn setImage:centerSelectedImage forState:UIControlStateSelected];
}

//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden){
        return [super hitTest:point withEvent:event];
    }else {
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            //返回按钮
            return _centerBtn;
        }else {
            return [super hitTest:point withEvent:event];
        }
    }
}

@end
