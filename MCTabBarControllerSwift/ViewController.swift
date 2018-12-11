//
//  ViewController.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
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
        
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: 20))
        label.textColor = UIColor.white
        label.text = "点击空白区域退出"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func buttonAction(){
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

