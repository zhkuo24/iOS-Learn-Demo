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
    }
    
    

}
