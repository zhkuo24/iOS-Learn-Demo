//
//  Yellow2View.swift
//  事件传递及响应Demo
//
//  Created by zhangkuo on 16/9/12.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Yellow2View: UIView {
    @IBOutlet weak var button: UIButton!
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        //当前坐标系的点转到按钮上的点
        let btnP = convertPoint(point, toView: button)
        
        //判断点在不在按钮上 注意坐标系采用的是方法调用者的坐标系
        if button.pointInside(btnP, withEvent: event) {
            //点在按钮上
            return button
        }else {
            return super.hitTest(point, withEvent: event)
        }
 
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(self)
    }

}
