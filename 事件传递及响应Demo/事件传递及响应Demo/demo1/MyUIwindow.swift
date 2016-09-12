//
//  MyUIwindow.swift
//  事件传递及响应Demo
//
//  Created by zhangkuo on 16/9/12.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class MyUIwindow: UIWindow {

    
    /**
     事件传递的时候调用，当事件传递给控件的时候，就会调用控件的这个方法去寻找最合适的 View
     */
    //作用：寻找最合适的View
    
    //point:当前的触摸点，point点的坐标系就是方法调用者，谁调用hitTest方法，坐标系就是谁。
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        print(#function)
        let fitView: UIView = super.hitTest(point, withEvent: event)!
//        print(fitView)
        //调用系统的做法去寻找最合适的View
        return fitView
        
        //return subviews[0].subviews[0]
//        return nil //都不处理
    }
    
    /**
     作用： 判断当前这个点在不在方法调用者（控件上）
     */
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return true
    }
    

}
