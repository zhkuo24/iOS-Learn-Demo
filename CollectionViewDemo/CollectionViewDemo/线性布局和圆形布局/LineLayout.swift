//
//  LineLayout.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/30.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

//线性布局仍是FlowLayout的特殊情况

class LineLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        //可以初始化一些恒定的值
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
     * 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作）
     */
    override func prepareLayout() {
        super.prepareLayout()
        scrollDirection = UICollectionViewScrollDirection.Horizontal //水平方向滚动
        //设置内边距
        let inset: CGFloat = 0.5 * ((collectionView?.frame.size.width)! - itemSize.width)
        sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
        //根据具体情况设置
//        minimumInteritemSpacing = 10
//        minimumLineSpacing = 50
        
        
    }
    
    /**
     UICollectionViewLayoutAttributes 
     1. 一个cell对应一个UICollectionViewLayoutAttributes对象
     2. UICollectionViewLayoutAttributes对象决定了cell的frame等各种信息
     这个方法返回值是一个数组，数组存放的是在rect范围内所有元素的布局属性
     这个方法的返回值决定了rect范围内所有元素的排布
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        //因为继承的FlowLayout，所有首先得到super的已经计算好的布局属性，
        //如果完全继承自UICollectionViewLayout则需要自己完全计算布局属性
        //为了得到中间放大的效果
        guard let superArray = super.layoutAttributesForElementsInRect(rect) else { return nil }
        
        // copy items
        guard let attributes = NSArray(array: superArray, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
        
        // modify attributes

    
        //以contentSize为基准，计算collectionView的最中心点的x值
        //cell的属性是以contentsize的坐标系为基准的
        let centerX: CGFloat = (collectionView?.contentOffset.x)! + (collectionView?.frame.size.width)! * 0.5
        
        //在原有布局上进行微调来设置cell的大小，越靠近中心cell越大,通过计算cell中心点 和collectionView的中心点的x值来比较
        
        for attrs in attributes {
            
            let delta: CGFloat = abs((attrs as UICollectionViewLayoutAttributes).center.x - centerX)
            
            //根据间距来计算cell的缩放比例
            let scale: CGFloat = 1 - delta / (collectionView?.frame.size.width)!
            
            attrs.transform = CGAffineTransformMakeScale(scale, scale)
        }
        
        
        
        
        return attributes
    }
    
    
    // 停止滚动时自动定位到collectionView的中心
    //targetContentOffsetForProposedContentOffset:控制控制最后UICollectionView的最后去哪里，我们这里需要做的吸附效果的逻辑代码就需要在这里完成。
    //参数介绍proposedContentOffset:原本UICollectionView停止滚动那一刻的位置 contentOffset的坐标；velocity：滚动速度
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        //计算最终显示的矩形框
        var rect: CGRect = CGRectZero
        rect.origin.y = 0
        rect.origin.x = proposedContentOffset.x
        rect.size = (collectionView!.frame.size)
        
        //根据最终的矩形来获得super已经计算好的属性
   

        let originArray = super.layoutAttributesForElementsInRect(rect)
        let attributes = NSArray(array: originArray!, copyItems: true) as? [UICollectionViewLayoutAttributes]
        
        //计算collectionView最中心点的x值
        let centerX = proposedContentOffset.x + collectionView!.frame.size.width * 0.5
        
        //存放做小间距
        var minDelta: CGFloat = CGFloat(MAXFLOAT)
        for attrs in attributes! {
            if abs(minDelta) > abs(attrs.center.x - centerX) {
                minDelta = attrs.center.x - centerX
            }
        }
        //修改原有的偏移量

        return CGPointMake(proposedContentOffset.x + minDelta, proposedContentOffset.y)
        
    }
    

}
