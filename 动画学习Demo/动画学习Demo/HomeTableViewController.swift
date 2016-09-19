//
//  HomeTableViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/17.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    let datas = ["1. UIView 开始结束动画","2. UIView Block 动画","3. UIView 转场动画","4. 核心动画","5. 核心动画-动画组"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = datas[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("animation01", sender: nil)
        case 1:
            performSegueWithIdentifier("animation02", sender: nil)
        case 2:
            performSegueWithIdentifier("animation03", sender: nil)
        case 3:
            performSegueWithIdentifier("animation04", sender: nil)
        case 4:
            performSegueWithIdentifier("animation05", sender: nil)
        default:
            print("default")
        }
    }
 

    
}


