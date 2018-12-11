//
//  NormalTabBarExample.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
//

import UIKit

class NormalTabBarExample: MCTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //选中时的颜色
//        mcTabBar.tintColor = UIColor(red: 27.0/255.0, green: 118.0/255.0, blue: 208/255.0, alpha: 1)
        //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
        mcTabBar.isTranslucent = false
        mcTabBar.centerImage = UIImage(named: "tab_unselect_gray")!
        mcTabBar.centerSelectedImage = UIImage(named: "tab_select_blue")!
        addChildViewControllers()
    }
    
    //添加子控制器
    func addChildViewControllers() {
        //图片大小建议32*32
        addChildViewController(ViewController(), title: "首页", imageName: "tab1")
        //中间这个不设置东西，只占位
        addChildViewController(ViewController(), title: "", imageName: "")
        addChildViewController(ViewController(), title: "发现", imageName: "tab3")
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
}
