//
//  ViewController.swift
//  MCTabbarDemoSwift
//
//  Created by caohouhong on 2018/12/4.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomColor = UIColor(red: CGFloat((arc4random()%255))/255.0, green: CGFloat((arc4random()%255))/255.0, blue: CGFloat((arc4random()%255))/255.0, alpha: 1)
        self.view.backgroundColor = randomColor
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 80))
        button.center = self.view.center
        button.layer.cornerRadius = 5.0
        button.setTitle("按钮", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func buttonAction(){
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
}

