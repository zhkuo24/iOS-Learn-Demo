//
//  BaseView.swift
//  事件传递及响应Demo
//
//  Created by zhangkuo on 16/9/12.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("\(self.classForCoder)------touchesBegan")
    }

}
