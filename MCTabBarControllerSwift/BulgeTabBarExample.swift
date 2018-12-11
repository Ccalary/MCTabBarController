//
//  BulgeTabBarExample.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
//

import UIKit

class BulgeTabBarExample: MCTabBarController,MCTarBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //选中时的颜色
        mcTabBar.tintColor = UIColor(red: 251.0/255.0, green: 199.0/255.0, blue: 115.0/255.0, alpha: 1)
        //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
        mcTabBar.isTranslucent = false
        mcTabBar.positon = .bulge
        mcTabBar.centerImage = UIImage(named: "tabbar_add_yellow")!
        self.mcDelegate = self
        addChildViewControllers()
    }
    
    //添加子控制器
    func addChildViewControllers() {
        //图片大小建议32*32
        addChildViewController(ViewController(), title: "首页", imageName: "tab1")
        addChildViewController(ViewController(), title: "应用", imageName: "tab2")
        //中间这个不设置东西，只占位
        addChildViewController(ViewController(), title: "发布", imageName: "")
        addChildViewController(ViewController(), title: "消息", imageName: "tab3")
        addChildViewController(ViewController(), title: "我的", imageName: "tab4")
    }
    
    
    // 添加子vc
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        if imageName.count > 0{
            childController.tabBarItem.image = UIImage(named: imageName)
            childController.tabBarItem.selectedImage = UIImage(named: imageName)
        }
        let nav = BaseNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
    
    func mcTabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 2 {
            rotationAnimation()
        }else {
            removeAnimation()
        }
    }
    
    // 旋转动画
    func rotationAnimation() {
        if "key" == self.mcTabBar.centerBtn.layer.animationKeys()?.first {
            return
        }
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber(value: Double.pi*2.0)
        animation.duration = 3.0
        animation.repeatCount = HUGE
        self.mcTabBar.centerBtn.layer.add(animation, forKey: "key")
    }
    
    func removeAnimation() {
        self.mcTabBar.centerBtn.layer.removeAllAnimations()
    }
}
