//
//  BaseCollectionViewController.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

class BaseCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DOTA2 英雄"

        // 在storyboard中原型cell不需要注册cell，除非自己创建class或者nib需要创建
//        self.collectionView!.registerClass(ImageCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dota2Avart.count
        case 1:
            return dota2Pic.count
        default:
            return 0
        }
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var imageCell: UICollectionViewCell!
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCell
            
            
            cell.dotaImageView.image = UIImage(named: dota2Avart[indexPath.item])
            cell.nameLabel.text = "第\(indexPath.item)个图像"
            //        cell.backgroundColor = UIColor.redColor()
            //        cell.backgroundView = UIImageView(image: UIImage(named: "dota2-0"))
            imageCell = cell
        }
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCell
            cell.dotaImageView.image = UIImage(named: dota2Pic[indexPath.item])
            cell.nameLabel.text = "第\(indexPath.item)个图像"
            imageCell = cell
        }
        return imageCell
        
    }
    
    //显示header
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            let headView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
            headView.headLabel.text = "这是header\(indexPath.section)"
            
            reusableView = headView
        }
        if kind == UICollectionElementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footer", forIndexPath: indexPath) as! FooterCollectionReusableView
            footerView.footerLabel.text = "这是footer\(indexPath.section)"
            
            reusableView = footerView
        }
        
        return reusableView
        
    }
    

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("这是section\(indexPath.section)的第\(indexPath.item)item")
        performSegueWithIdentifier("detailSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let index = sender as! NSIndexPath
        print(index)
        
        let dvc = segue.destinationViewController as! BaseDetailViewController
        if index.section == 0 {
            dvc.imageName = dota2Avart[index.item]
        }else {
            dvc.imageName = dota2Pic[index.item]
        }
//        dvc.imageName =
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
