//
//  PubuLayout.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/29.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

//完全自定义FlowLayout,但是仍以FlowLayout为基础

class PubuLayout: UICollectionViewFlowLayout {
    
    private var insertIndexPath = [NSIndexPath]()
    
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //itemSize等可以再外面设置 
    
    /**
     * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
     * 一旦重新刷新布局，就会重新调用下面的方法：
     1.prepareLayout
     2.layoutAttributesForElementsInRect:方法
     */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    /**
     *  用来做布局的初始化操作，不建议在init方法中进行布局的初始化操作
     */
    override func prepareLayout() {
        super.prepareLayout()//一定要调用布局初始化
        scrollDirection = UICollectionViewScrollDirection.Vertical
        
        //设置内边距
//        let inset: CGFloat = 10
        sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
    }
    
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath)
        if insertIndexPath.contains(itemIndexPath) {
            attributes!.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.2, 0.2), CGFloat(M_PI));
            attributes!.center = CGPointMake(CGRectGetMidX(collectionView!.bounds), CGRectGetMaxY(collectionView!.bounds));
            
        }
        
        return attributes
        
    }
    
    override func prepareForAnimatedBoundsChange(oldBounds: CGRect) {
        print(#function)
    }
    override func prepareForCollectionViewUpdates(updateItems: [UICollectionViewUpdateItem]) {
        print(#function)
        super.prepareForCollectionViewUpdates(updateItems)
        insertIndexPath = [NSIndexPath]()
        for update in updateItems {
            if update.updateAction == UICollectionUpdateAction.Insert {
                insertIndexPath.append(update.indexPathAfterUpdate!)
            }
        }
        
    }
    
    
    
    
    
//    override func collectionViewContentSize() -> CGSize {
//        return CGSizeMake(300, 1400)
//    }
    
    

}
