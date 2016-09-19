//
//  Animation01ViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/18.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Animation01ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testView2: UIView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startAnimation(sender: AnyObject) {
        
        //开始动画
        changeFrame()

        
    }
    
    @IBAction func transBtn(sender: AnyObject) {
        flipAni()
        
    }
    
    private func changeFrame() {
        UIView.beginAnimations("frameAni", context: nil)
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationDuration(1)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector(#selector(Animation01ViewController.startAni))
        UIView.setAnimationDidStopSelector(#selector(Animation01ViewController.stopAni))
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationRepeatCount(1)
//        UIView.setAnimationRepeatAutoreverses(true)//是否以动画的效果恢复原来
        testView.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        testView.backgroundColor = UIColor.redColor()
        UIView.commitAnimations()
    }
    func startAni() {
        print("startAni")
        
    }
    func stopAni() {
        print("stopAni")
    }
    
    private func  flipAni() {
        UIView.beginAnimations("FlipAni", context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationRepeatCount(1)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: testView2, cache: true)
        image.image = UIImage(named: "dota2-0")
        UIView.commitAnimations()
    }
    


}
