//
//  Animation05ViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/19.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Animation05ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: AnyObject) {
        groupAni()
    }

    
    private func groupAni() {
        
        let posAni = CABasicAnimation(keyPath: "position")
        posAni.toValue = NSValue(CGPoint: CGPoint(x: 310, y: 400))
        let boundAni = CABasicAnimation(keyPath: "bounds")
        boundAni.toValue = NSValue(CGRect: CGRectMake(0, 0, 200, 200))
        let colorAni = CABasicAnimation(keyPath: "backgroundColor")
        colorAni.toValue = UIColor.redColor().CGColor
        
        let groupAni = CAAnimationGroup()
        groupAni.animations = [posAni, boundAni, colorAni]
        groupAni.duration = 1.5
        groupAni.fillMode = kCAFillModeForwards
        groupAni.removedOnCompletion = false
        groupAni.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view1.layer.addAnimation(groupAni, forKey: "groupAni")
        
    }

}
