//
//  Animation04ViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/18.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Animation04ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    var layer: CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "核心动画 Demo"
        
        layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        layer.backgroundColor = UIColor.blueColor().CGColor
        view1.layer.addSublayer(layer)
        
        
         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start1(sender: AnyObject) {
        
        CATransaction.begin()
//        CATransaction.setAnimationDuration(2.0)
        CATransaction.setValue(3.0, forKey: "animationDuration")
        let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        CATransaction.setAnimationTimingFunction(linearTiming)
        
        CATransaction.setCompletionBlock { 
            print("完成")
        }
        layer.backgroundColor = UIColor.redColor().CGColor
        layer.frame = CGRect(x: 120, y: 120, width: 100, height: 100)
        view1.layer.backgroundColor  = UIColor.redColor().CGColor
        view1.layer.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        CATransaction.commit()
        
    }
    
    @IBAction func start2(sender: AnyObject) {
        coreAni1()
    }
    @IBAction func start3(sender: AnyObject) {
        coreAni2()
    }
    
    @IBAction func start4(sender: AnyObject) {
        keyframeAni()
    }
    
    @IBAction func start5(sender: AnyObject) {
        pathAni()
    }
    @IBAction func start6(sender: AnyObject) {
        transAni()
        
    }
    @IBAction func start7(sender: AnyObject) {
        springAni()
        
    }
    @IBAction func start8(sender: AnyObject) {
        
    }
    private func coreAni1() {
        print("coreAni1")
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 2.0
//        animation.fromValue = UIColor.blackColor()
        animation.toValue = NSValue(CGPoint: CGPointMake(300, 300))
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
//        animation.setValue(UIColor.redColor().CGColor, forKeyPath: "backgroundColor")
        view2.layer.addAnimation(animation, forKey: "color")
        
    
    }
    
    private func coreAni2() {
        print("coreAni1")
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 2.0
        //        animation.fromValue = UIColor.blackColor()
        animation.toValue = M_PI
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        //        animation.setValue(UIColor.redColor().CGColor, forKeyPath: "backgroundColor")
        view2.layer.addAnimation(animation, forKey: "color")
        
        
    }
    
    private func keyframeAni() {
        let keyframeAni: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        keyframeAni.duration = 2.0
        keyframeAni.removedOnCompletion = false
        keyframeAni.fillMode = kCAFillModeForwards
        keyframeAni.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      
        let value1 = NSValue(CGPoint: CGPointMake(150, 200))
        let value2 = NSValue(CGPoint: CGPointMake(250, 200))
        let value3 = NSValue(CGPoint: CGPointMake(250, 300))
        let value4 = NSValue(CGPoint: CGPointMake(150, 300))
        let value5 = NSValue(CGPoint: CGPointMake(150, 200))
        keyframeAni.values = [value1, value2, value3, value4, value5]
        keyframeAni.keyTimes = [0.1,0.5,0.7,0.8,1]
        keyframeAni.calculationMode = kCAAnimationCubicPaced
        view2.layer.addAnimation(keyframeAni, forKey: "core")
        
    
    }
    
    private func pathAni() {
        //设置 Path
        
        let ani = CAKeyframeAnimation(keyPath: "position")
        let path = CGPathCreateMutable()
        CGPathAddEllipseInRect(path, nil, CGRectMake(150, 200, 200, 200))
        ani.path = path
        ani.duration = 2.0
        ani.removedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        view1.layer.addAnimation(ani, forKey: "hh")
        
        
        
    }
    private func transAni() {
      
        
        let ani = CATransition()
        ani.type = "suckEffect"
        ani.subtype = kCATransitionFromLeft
        ani.duration = 1.5
        view4.backgroundColor = UIColor.blueColor()
        view4.layer.addAnimation(ani, forKey: "transition")
        
    }
    private func springAni() {
        
        let ani = CASpringAnimation(keyPath: "bounds")
        ani.mass = 10.0 //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
        ani.stiffness = 5000 //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
        ani.damping = 100.0//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
        ani.initialVelocity = 5.0//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
        ani.duration = ani.settlingDuration
        ani.toValue = NSValue(CGRect: view4.bounds)
        ani.removedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view2.layer.addAnimation(ani, forKey: "boundsAni")
        
    }
    
  

   

}
