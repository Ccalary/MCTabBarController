//
//  MCTabbarController.swift
//  MCTabbarDemoSwift
//
//  Created by caohouhong on 2018/12/4.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

import UIKit

class MCTabbarController: UITabBarController,UITabBarControllerDelegate{
    
    var mTabBar: MCTabBar!
    var selectItem: Int = 0 // 选中的item
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTabBar = MCTabBar(frame: CGRect.zero)
        mTabBar.centerBtn.addTarget(self, action: #selector(centerBtnAction), for: .touchUpInside)
        //选中时的颜色
        mTabBar.tintColor = UIColor(red: 27.0/255.0, green: 118.0/255.0, blue: 208/255.0, alpha: 1)
        //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
        mTabBar.isTranslucent = false
        self.setValue(mTabBar, forKeyPath: "tabBar")
        self.delegate = self as UITabBarControllerDelegate
       
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //添加子控制器
    func addChildViewControllers() {
        //图片大小建议32*32
        addChildViewController(ViewController(), title: "首页", imageName: "tab1")
        addChildViewController(ViewController(), title: "扩展", imageName: "tab2")
        //中间这个不设置东西，只占位
        addChildViewController(ViewController(), title: "旋转", imageName: "")
        addChildViewController(ViewController(), title: "发现", imageName: "tab3")
        addChildViewController(ViewController(), title: "我的", imageName: "tab4")
    }
    
    // 添加子vc
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName)
        let nav = BaseNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
    
    //tabbar选择时的代理
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 2 {//选中中间的按钮
            if (self.selectItem != tabBarController.selectedIndex){// 如果是重复选择不做处理
                rotationAnimation()
            }
        }else {
            mTabBar.centerBtn.layer.removeAllAnimations()
        }
        self.selectItem = tabBarController.selectedIndex
    }
    
    // 中间按钮点击
    @objc func centerBtnAction() {
        self.selectedIndex = 2// 关联中间按钮
        if (self.selectItem != self.selectedIndex){// 重复选择不做处理
            rotationAnimation()
        }
        self.selectItem = self.selectedIndex
    }
    
    // 旋转动画
    func rotationAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber(value: Double.pi*2.0)
        animation.duration = 3.0
        animation.repeatCount = HUGE
        mTabBar.centerBtn.layer.add(animation, forKey: "animation")
    }
}
