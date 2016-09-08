//
//  HomeTableViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var datas: [String] = ["1. 最基本的流水线布局 - Storyboard", "2. 最基本的流水线布局 - 代码", "3. 自定义插入、删除 cell 的动画", "4. 线性布局和圆形布局", "5. 瀑布流布局"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "几种不同的 CollectionView 布局"
        
        


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
        //直接使用storyboard中的cell，可以不用注册cell。如果自定义cell或者nib实现cell，均需要注册cell。
        //tableView.registerNib(nib: UINib?, forCellReuseIdentifier: String)
        //tableView.registerClass(cellClass: AnyClass?, forCellReuseIdentifier: String)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("datasCell", forIndexPath: indexPath)

        cell.textLabel?.text = datas[indexPath.row]

        return cell
    }
    
    // MARK: - Table view Data Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("toBaseColletciton", sender: nil)
        case 1:
            performSegueWithIdentifier("toBaseCode", sender: nil)
        case 2:
            performSegueWithIdentifier("toPubu", sender: nil)
        case 3:
            performSegueWithIdentifier("toLine", sender: nil)
        case 4:
            performSegueWithIdentifier("toWaterfall", sender: nil)
        default:
            print("default")
        }
    }


    
}
