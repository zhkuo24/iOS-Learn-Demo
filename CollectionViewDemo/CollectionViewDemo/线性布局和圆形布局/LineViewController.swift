//
//  LineViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/30.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class LineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false //消除导航栏对view布局的影响
        
        view.backgroundColor = UIColor.grayColor()
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册需要的cell
        collectionView.registerNib(UINib(nibName: "LineCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "lineCell")
    }
    
    
    
    
    //MARK: - Button 方法
    
    //切换布局
    @IBAction func ChangeLayout() {
        
        if collectionView.collectionViewLayout.isKindOfClass(LineLayout) {
            collectionView.setCollectionViewLayout(CircleLayout(), animated: true)
        }else {
            let layout = LineLayout()
            layout.itemSize = CGSizeMake(150, 150)
            collectionView.setCollectionViewLayout(layout, animated: true)
            
        }
    }
    
    //增加
    
    @IBAction func AddItem(sender: AnyObject) {
        let a = UInt32(dota2Avart.count) < 13 ? UInt32(dota2Avart.count): 13
        let picNumber = Int(arc4random_uniform(a))
        dota2Avart.insert("dota2-" + "\(picNumber)", atIndex: picNumber)
        let index = Int(arc4random_uniform(UInt32(dota2Avart.count)))
        
        collectionView.insertItemsAtIndexPaths([NSIndexPath(forItem: index, inSection: 0)])
        
        
    }

    
    
    
    //懒加载一个collectionView
    lazy var collectionView: UICollectionView = {
        //不在使用自带的 collectionViewLayout ，而是自定义的 PubuLayout
        let layout = CircleLayout()
        let collectionW: CGFloat = self.view.frame.size.width
        let collectionH: CGFloat = 300.0
        let frame = CGRectMake(0, 150, collectionW, collectionH)
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
//        layout.itemSize = CGSize(width: 100, height: 100)
        cv.backgroundColor = UIColor.cyanColor()
        cv.showsHorizontalScrollIndicator = false
        
        return cv
        
    }()
    
    

}


//MARK: - 实现data source

extension LineViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dota2Avart.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("lineCell", forIndexPath: indexPath) as! LineCell
        cell.lineImageView.image = UIImage(named: dota2Avart[indexPath.item])
        return cell
    }
    
    
    
    
}

extension LineViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        dota2Avart.removeAtIndex(indexPath.item)
        collectionView.deleteItemsAtIndexPaths([indexPath])
    }
    
}












