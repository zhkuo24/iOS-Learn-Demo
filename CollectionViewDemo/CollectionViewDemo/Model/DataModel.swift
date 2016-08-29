//
//  DataModel.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit


    
var dota2Avart:[String] = [String]()
var dota2Pic: [String] = [String]()

var colors:[UIColor] = [UIColor]()

func InitDataModel() {
    
    //简单的初始化两个数组后面使用
    
    for i in 0...30 {
        
        dota2Pic.append("DOTA2_" +  "\(i)")
    }
    for i in 0...13 {
        dota2Avart.append("dota2-" + "\(i)")
    }
}

//准备数据，存储随机颜色





