//
//  PushViewController.swift
//  MCTabbarDemoSwift
//
//  Created by caohouhong on 2018/12/5.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let randomColor = UIColor(red: CGFloat((arc4random()%255))/255.0, green: CGFloat((arc4random()%255))/255.0, blue: CGFloat((arc4random()%255))/255.0, alpha: 1)
        self.view.backgroundColor = randomColor
        self.navigationItem.title = "Push VC"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
