//
//  CircleLayout.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/30.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class CircleLayout: UICollectionViewLayout {
    
    private var attrsArray = [UICollectionViewLayoutAttributes]() //用于存储布局属性
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareLayout() {
        super.prepareLayout()
        attrsArray.removeAll()
        let number = collectionView!.numberOfItemsInSection(0)
        
        for i in 0 ..< number {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attributes = layoutAttributesForItemAtIndexPath(indexPath)!
            attrsArray.append(attributes)
            
        }
        
    }
    
    //这个方法返回的是在rect范围内的布局属性，一般利用layoutAttributesForItemAtIndexPath的结果
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    
    // 这个方法需要返回indexPath位置对应的cell 的布局属性
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        let number = collectionView?.numberOfItemsInSection(0)
        let radius: CGFloat = 80
        //圆心位置
        let oX: CGFloat = collectionView!.frame.size.width * 0.5
        let oY: CGFloat = collectionView!.frame.size.height * 0.5
        
        attrs.size = CGSizeMake(60, 60)
        if number == 1 {
            attrs.center = CGPointMake(oX, oY)
        }else {
            let angle: CGFloat = (2 * CGFloat(M_PI) / CGFloat(number!)) * CGFloat(indexPath.item)
            let centerX: CGFloat = oX + radius * cos(angle)
            let centerY: CGFloat = oY - radius * sin(angle)
            attrs.center = CGPointMake(centerX, centerY)
        }
        return attrs
        
        
    }
    
    

}
