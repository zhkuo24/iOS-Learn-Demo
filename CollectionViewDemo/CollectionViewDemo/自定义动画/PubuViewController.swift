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
        
       

        title = "自定义插入、删除 cell 动画"
        let button1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(PubuViewController.addItem))
        let button2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: #selector(PubuViewController.removeItem))
        navigationItem.rightBarButtonItems = [button1, button2]
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册需要的cell
        collectionView.registerNib(UINib(nibName: "ColorViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "colorCell")
    }
    
    
    func addItem() {
        
        colors.append(randomColor())
        collectionView.insertItemsAtIndexPaths([NSIndexPath(forItem: colors.count-1, inSection: 0)])
        
//        collectionView.performBatchUpdates({ 
////            colors.append(randomColor())
////            self.collectionView.insertItemsAtIndexPaths([NSIndexPath(forItem: colors.count-1, inSection: 0)])
//            colors.removeLast()
//            colors.removeLast()
//            self.collectionView.deleteItemsAtIndexPaths([NSIndexPath(forItem: 2, inSection: 0)])
//            self.collectionView.deleteItemsAtIndexPaths([NSIndexPath(forItem: 4, inSection: 0)])
//
//            }) { (_) in
//                self.collectionView.reloadData()
//        }
        
       
        
    }
    
    func removeItem() {
        
        colors.removeLast()
        collectionView.deleteItemsAtIndexPaths([NSIndexPath(forItem: colors.count, inSection: 0)])
        
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //懒加载一个collectionView
    lazy var collectionView: UICollectionView = {
        
        
        
//        let flowLayout = UICollectionViewFlowLayout()
        //        let cv = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: flowLayout)
        //不在使用自带的 collectionViewLayout ，而是自定义的 PubuLayout
        let layout = PubuLayout()
        let cv = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        cv.backgroundColor = UIColor.whiteColor()
        cv.showsVerticalScrollIndicator = false
        
        return cv
        
    }()

}
//MARK: - 实现 collectionView 的 Delegate 

extension PubuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        collectionView.performBatchUpdates({ 
            collectionView.deleteItemsAtIndexPaths([indexPath])
            colors.removeAtIndex(indexPath.row)
            }) { (_) in
                collectionView.reloadData()
        }
        collectionView.reloadData()
    
    }
    
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