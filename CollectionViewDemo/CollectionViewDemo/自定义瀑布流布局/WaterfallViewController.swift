//
//  WaterfallViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/9/7.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit
import MJRefresh

class WaterfallViewController: UIViewController {
    
    //定义一个数组保存数据
    var colorsData = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupRefresh()
        


        
    }

    private func setupUI() {
        title = "自定义瀑布流布局"
        view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        }
        
        // 注册cell
        collectionView.registerNib(UINib(nibName: "MyWaterfallCell" ,bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "waterfallCell")
    }
    private func setupRefresh() {
        collectionView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(WaterfallViewController.loadNewColors))
        collectionView.mj_header.beginRefreshing()
        
        collectionView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(WaterfallViewController.loadMoreColors))
        
        collectionView.mj_footer.hidden = true
        
        
    }
    
    func loadNewColors() {
        let time: NSTimeInterval = 1.0
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) { 
            self.colorsData.removeAll()
            self.colorsData.appendContentsOf(colors)
            
            self.collectionView.reloadData()
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.hidden = false
        }
        
    }
    
    func loadMoreColors() {
        let time: NSTimeInterval = 1.0
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {

            self.colorsData.appendContentsOf(colors)
            
            self.collectionView.reloadData()
            self.collectionView.mj_footer.endRefreshing()
        }
        
    }
    
    
    lazy var collectionView: UICollectionView = {
       
        let layout = WaterfallLayout()
        
        let cv: UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        cv.delegate = self
        cv.dataSource = self
        layout.delegate = self
        return cv
        
    }()
    
}


extension WaterfallViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("waterfallCell", forIndexPath: indexPath) as! MyWaterfallCell
        cell.backgroundColor = colorsData[indexPath.item]
        cell.numLabel.text = "\(indexPath.item)"
        return cell
    }
    
}

//MARK: - 自定义的代理 设置 高度 WaterfallLayoutDelegate
// 直接通过ViewController来更改layout 的属性，具有更好的独立性
extension WaterfallViewController: WaterfallLayoutDelegate {
    
    func waterfallLayout(waterfallLayout: WaterfallLayout, heightForItemAtIndex index: Int) -> CGFloat {
        
        return 50.0 + CGFloat(arc4random_uniform(100))
    }
    
    func rowMarginInWaterfallLayout(waterfallLayout: WaterfallLayout) -> CGFloat {
        return 10
    }
    
    func columnMarginInWaterfallLayout(waterfallLayout: WaterfallLayout) -> CGFloat {
        return 10
    }
    
    func columnCountInWaterfallLayout(waterfallLayout: WaterfallLayout) -> Int {
        return 4
    }
    
    func edgeInsetInWaterfallLayout(waterfallLayout: WaterfallLayout) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
}
