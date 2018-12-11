//
//  MCTabBar.h
//  MCTabBarDemo
//
//  Created by chh on 2017/12/18.
//  Copyright © 2017年 Mr.C. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MCTabBarCenterButtonPosition){
    MCTabBarCenterButtonPositionCenter, // 居中
    MCTabBarCenterButtonPositionBulge // 凸出一半
};

@interface MCTabBar : UITabBar
/**
 中间按钮
 */
@property (nonatomic, strong) UIButton *centerBtn;

/**
  中间按钮图片
 */
@property (nonatomic, strong) UIImage *centerImage;
/**
 中间按钮选中图片
 */
@property (nonatomic, strong) UIImage *centerSelectedImage;

/**
 中间按钮偏移量,两种可选，也可以使用centerOffsetY 自定义
 */
@property (nonatomic, assign) MCTabBarCenterButtonPosition position;

/**
  中间按钮偏移量，默认是居中
 */
@property (nonatomic, assign) CGFloat centerOffsetY; 

/**
  中间按钮的宽和高，默认使用图片宽高
*/
@property (nonatomic, assign) CGFloat centerWidth, centerHeight;

@end
