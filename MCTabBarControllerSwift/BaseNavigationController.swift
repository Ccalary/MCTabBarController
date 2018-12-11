//
//  BaseNavigationController.swift
//  MCTabbarDemoSwift
//
//  Created by caohouhong on 2018/12/5.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = UINavigationBar.appearance()
        //设置false之后自动下沉navigationBar 高度
        self.navigationBar.isTranslucent = true
        //设置navigationBar的背景色
        navBar.barTintColor = UIColor.white
        //设置左右bar的颜色
//        navBar.tintColor = UIColor.red
//        // 设置标题的样式
//        let attriDic = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18),NSAttributedStringKey.foregroundColor:UIColor.red]
//        navBar.titleTextAttributes = attriDic
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 不是第一级vc
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            // 可以在这里设置返回按钮等,重写后侧滑返回失效需要自己单独处理
            //backBarButtonItem 是带有字和返回箭头的样式
            /*
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_13x21"), style: .plain, target: self, action: #selector(navBackAction))
            */
        }
        //一定要写在最后，要不然无效
        super.pushViewController(viewController, animated: true)
    }

    // 返回操作
    @objc func navBackAction(){
        popViewController(animated: true)
    }

}
