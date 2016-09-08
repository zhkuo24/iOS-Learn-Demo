//
//  WaterfallLayouDelegate.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/9/8.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

//代理 用于接口设置 layout不依赖数据

@objc protocol WaterfallLayoutDelegate {
    func waterfallLayout(waterfallLayout: WaterfallLayout, heightForItemAtIndex index: Int) -> CGFloat
    //设置代理来间接设置layout布局中一些属性
    optional func columnCountInWaterfallLayout(waterfallLayout: WaterfallLayout) -> Int
    optional func columnMarginInWaterfallLayout(waterfallLayout: WaterfallLayout) -> CGFloat
    optional func rowMarginInWaterfallLayout(waterfallLayout: WaterfallLayout) -> CGFloat
    optional func edgeInsetInWaterfallLayout(waterfallLayout: WaterfallLayout) -> UIEdgeInsets
}
