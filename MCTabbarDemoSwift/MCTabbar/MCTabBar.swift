//
//  MCTabBar.swift
//  MCTabbarDemoSwift
//
//  Created by caohouhong on 2018/12/5.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

import UIKit

class MCTabBar: UITabBar {
    
    var centerBtn: UIButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        //  设定button大小为适应图片
        let normalImg = UIImage(named: "tabbar_add")
        centerBtn.setImage(normalImg, for: .normal)
        //去除选择时高亮
        centerBtn.adjustsImageWhenHighlighted = false
        //根据图片调整button的位置(图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
        let btnWidth = (normalImg?.size.width) ?? 0
        let btnHeight = (normalImg?.size.height) ?? 0
        centerBtn.frame = CGRect(x: (UIScreen.main.bounds.width - btnWidth)/2.0, y: -btnHeight/2.0, width: btnWidth, height: btnHeight)
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
