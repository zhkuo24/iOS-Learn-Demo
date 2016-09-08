//
//  BaseViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DOTA2 英雄"
        
        
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册需要的cell
        collectionView.registerNib(UINib(nibName: "ImageCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "myImageCell")
        // 添加长按手势来拖动cell
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(BaseViewController.longPressAction(_:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    
    //MARK: - 长按手势 此种方法只支持iOS9+
    
    func longPressAction(longPress: UILongPressGestureRecognizer) {
        
        let point: CGPoint = longPress.locationInView(collectionView)
        print(point)
        guard let indexPath = collectionView.indexPathForItemAtPoint(point) else {return}
        switch longPress.state {
        case .Began:
            
            collectionView.beginInteractiveMovementForItemAtIndexPath(indexPath)
            print("Began")
            
        case .Changed:
            collectionView.updateInteractiveMovementTargetPosition(point)
            print("Changed")
        case .Ended:
            collectionView.endInteractiveMovement()
            print("Ended")
        default:
            collectionView.cancelInteractiveMovement()
        }
        
        
        
        
    }
    


    
    
    
    
    //懒加载一个collectionView
    lazy var collectionView: UICollectionView = {
       
        
        
        let flowLayout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: flowLayout)
        let cv = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.orangeColor()
        cv.showsVerticalScrollIndicator = false
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        
        //这些属性可以在storyboard中设置，也可以在flowlayout的代理方法中设置
//        flowLayout.minimumInteritemSpacing = 10
//        flowLayout.minimumLineSpacing = 10
//        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 20)
//        flowLayout.itemSize = CGSize(width: 100, height: 121)
        
        return cv
        
    }()
    

    

}




//MARK: - 实现 collectionView 的 DataSource

extension BaseViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dota2Avart.count
        case 1:
            return dota2Pic.count
        default:
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myImageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        switch indexPath.section {
        case 0:
            
            cell.imageView.image = UIImage(named: dota2Avart[indexPath.item])
            cell.nameLabel.text = "第\(indexPath.item)个图像"
            
        case 1:
            cell.imageView.image = UIImage(named: dota2Pic[indexPath.item])
            cell.nameLabel.text = "第\(indexPath.item)个图像"
            
        default:
            cell.imageView.image = UIImage(named: dota2Avart[indexPath.item])
            cell.nameLabel.text = "第\(indexPath.item)个图像"
            
        }
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
    
    //移动结束后调用的方法
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        dota2Pic.removeAtIndex(sourceIndexPath.item)
        let imageName = dota2Pic[sourceIndexPath.item]
        dota2Pic.insert(imageName, atIndex: destinationIndexPath.item)
    }
    
    
    
    
}

// MARK: - 实现 UICollectionViewDelegateFlowLayout 方法

extension BaseViewController: UICollectionViewDelegateFlowLayout {
    //内边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 12, bottom: 20, right: 20)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    //可以根据不同的section设置不同的item的大小，直接在属性或storyboard中不好设置
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: 100, height: 121)
        case 1:
            return CGSize(width: 120, height: 221)
        default:
            return CGSizeZero
            
        }
    }
    
    /*
     footerSie
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
    }
 
 */
    
    
}

// MARK: - UICollectionView 的 Delegate 方法
extension BaseViewController: UICollectionViewDelegate {
    
  
    
    
    //设置选中某个cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //删除操作 自带动画，可以自定义
//        let indexPaths = collectionView.indexPathsForSelectedItems()
        /*
        if indexPath.section == 0 {
            dota2Avart.removeAtIndex(indexPath.row)
            
        }else {
            dota2Pic.removeAtIndex(indexPath.row)
        }
        collectionView.deleteItemsAtIndexPaths([indexPath])
 */
    }
    // 高亮动画
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        print(#function)
//        let selectCell = collectionView.cellForItemAtIndexPath(indexPath)
//        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
//            selectCell?.transform = CGAffineTransformMakeScale(2.0, 2.0)
//            }, completion: nil)
    }
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
//        let selectCell = collectionView.cellForItemAtIndexPath(indexPath)
//        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
//            selectCell?.transform = CGAffineTransformMakeScale(1.0, 1.0)
//            }, completion: nil)
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print(#function)
    }
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
    
    /*
    // 弹出cut copy paste菜单
    func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return true
    }
    func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        print(#function)
    }
    
    func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 */
    
    
    
}

