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
    private var deleteIndexPath = [NSIndexPath]()
    
    
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
//    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        print(#function)
//        return nil
//    }
    
    //增加操作时候的动画，设置cell的初始属性，结束属性默认就是在indexPath位置
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath)
        if insertIndexPath.contains(itemIndexPath) {
            attributes!.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.2, 0.2), CGFloat(M_PI))
            attributes!.center = CGPointMake(CGRectGetMidX(collectionView!.bounds), CGRectGetMaxY(collectionView!.bounds))
            
        }
        
        return attributes
        
    }
    
    //删除操作时候的属性，主要设置cell的最后位置的属性
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath)
        if deleteIndexPath.contains(itemIndexPath) {
            attributes?.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.2, 0.2), CGFloat(M_PI))
            attributes?.center = CGPointMake(CGRectGetMidX((collectionView!.bounds)), CGRectGetMaxY((collectionView!.bounds)))
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
        deleteIndexPath = [NSIndexPath]()
        for update in updateItems {
            
            switch update.updateAction {
            case .Insert:
                insertIndexPath.append(update.indexPathAfterUpdate!)
            case .Delete:
                deleteIndexPath.append(update.indexPathBeforeUpdate!)
            default:
                print("error")
            }
            
            if update.updateAction == UICollectionUpdateAction.Insert {
                
            }
        }
        
    }
    
    
    
    
    
    
//    override func collectionViewContentSize() -> CGSize {
//        return CGSizeMake(300, 1400)
//    }
    
    
    

}
