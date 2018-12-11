//
//  TableViewController.swift
//  MCTabBarControllerSwift
//
//  Created by caohouhong on 2018/12/11.
//  Copyright © 2018年 chh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataArray = ["Normal","Bulge"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TabBar Demo"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.present(NormalTabBarExample(), animated: true, completion: nil)
        case 1:
            self.navigationController?.present(BulgeTabBarExample(), animated: true, completion: nil)
            break
        default:
            break
        }
    }

}
