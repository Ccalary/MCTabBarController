//
//  MCTarBarController.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
//  https://github.com/Ccalary/MCTabBarController

import UIKit

protocol MCTarBarControllerDelegate : NSObjectProtocol {
     func mcTabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
}

class MCTabBarController: UITabBarController,UITabBarControllerDelegate {

    var mcTabBar = MCTabBar(frame: CGRect.zero)
    weak var mcDelegate : MCTarBarControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        mcTabBar.centerBtn.addTarget(self, action: #selector(centerBtnAction), for: .touchUpInside)
        self.setValue(mcTabBar, forKeyPath: "tabBar")
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        mcTabBar.centerBtn.isSelected = (tabBarController.selectedIndex == (viewControllers?.count)!/2)
        self.mcDelegate?.mcTabBarController(tabBarController, didSelect: viewController)
    }
    // 中间按钮点击
    @objc func centerBtnAction() {
        let count = viewControllers?.count ?? 0
        self.selectedIndex = count/2 // 关联中间按钮
        self.tabBarController(self, didSelect: viewControllers![selectedIndex])
    }
}
