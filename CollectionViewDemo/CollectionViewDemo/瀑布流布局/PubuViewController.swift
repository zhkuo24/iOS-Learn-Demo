//
//  PubuViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/29.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit
import RandomColorSwift

class PubuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        title = "瀑布流布局"
        let button1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(PubuViewController.addItem))
        let button2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: #selector(PubuViewController.removeItem))
        navigationItem.rightBarButtonItems = [button1, button2]
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        }
        
//        collectionView.delegate = self
        collectionView.dataSource = self
        //注册需要的cell
        collectionView.registerNib(UINib(nibName: "ColorViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "colorCell")
    }
    
    
    func addItem() {
        print(#function)
    }
    
    func removeItem() {
        print(#function)
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //懒加载一个collectionView
    lazy var collectionView: UICollectionView = {
        
        
        
        let flowLayout = UICollectionViewFlowLayout()
        //        let cv = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: flowLayout)
        let cv = UICollectionView(frame: CGRectZero, collectionViewLayout: PubuLayout())
        cv.backgroundColor = UIColor.whiteColor()
        cv.showsVerticalScrollIndicator = false
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        
        //这些属性可以在storyboard中设置，也可以在flowlayout的代理方法中设置
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 20)
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        return cv
        
    }()

}


//MARK: - 实现 collectionView 的 DataSource

extension PubuViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell", forIndexPath: indexPath) as! ColorViewCell
        cell.backgroundColor = colors[indexPath.row]
        cell.numberLabel.text = "\(indexPath.row)"
        
        return cell
    }
    
    
    
    
}