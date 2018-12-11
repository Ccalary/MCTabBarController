//
//  MCTabBar.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
//  https://github.com/Ccalary/MCTabBarController

import UIKit

public enum MCTabBarCenterButtonPosition : Int {
    case center // 居中
    case bulge  // 凸出一半
}

class MCTabBar: UITabBar {
    // tabbar高度49固定
    let MCTABBARHEIGHT: CGFloat = 49.0
    
    /**
     中间按钮
     */
    public var centerBtn: UIButton = UIButton(type: .custom)
    
    /**
      中间按钮图片
     */
    var centerImage: UIImage? {
        didSet {
            if (centerWidth <= 0 && centerHeight <= 0){
                centerWidth = centerImage?.size.width ?? 0
                centerHeight = centerImage?.size.height ?? 0
            }
            centerBtn.setImage(centerImage, for: .normal)
        }
    }
    /**
     中间选中图片
     */
    var centerSelectedImage: UIImage? {
        didSet {
            centerBtn.setImage(centerSelectedImage, for: .selected)
        }
    }
    
    /**
       中间按钮偏移量,两种可选，也可以使用centerOffsetY 自定义
     */
    var positon: MCTabBarCenterButtonPosition = .center
    
    /**
     中间按钮的宽和高，默认使用图片宽高
     */
    var centerWidth:CGFloat = 0
    var centerHeight:CGFloat = 0
    /**
     中间按钮偏移量，默认是居中
     */
    var centerOffsetY:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch positon {
        case .center:
            centerBtn.frame = CGRect(x: (UIScreen.main.bounds.size.width - centerWidth)/2.0, y: (MCTABBARHEIGHT - centerHeight)/2.0, width: centerWidth, height: centerHeight)
        case .bulge:
            centerBtn.frame = CGRect(x: (UIScreen.main.bounds.size.width - centerWidth)/2.0, y: -centerHeight/2.0 + centerOffsetY, width: centerWidth, height: centerHeight)
        }
    }
    
    func initView() {
        //去除选择时高亮
        centerBtn.adjustsImageWhenHighlighted = false
        self.addSubview(centerBtn)
    }
    
    //处理超出区域点击无效的问题
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.isHidden{
            //转换坐标
            let tempPoint = centerBtn.convert(point, from: self)
            //判断点击的点是否在按钮区域内
            if centerBtn.bounds.contains(tempPoint) {
                // 返回按钮
                return centerBtn
            }
        }
        return super.hitTest(point, with: event)
    }
}
