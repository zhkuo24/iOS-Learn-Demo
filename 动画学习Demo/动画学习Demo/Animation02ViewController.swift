//
//  Animation02ViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/18.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Animation02ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    let fram1 = CGRect(x: 100, y: 100, width: 100, height: 100)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func blockAni1() {
        UIView.animateWithDuration(2.0) {
            self.greenView.frame = self.fram1
            self.greenView.backgroundColor = UIColor.redColor()
        }
    }
    
    private func blockAni2() {
        
        UIView.animateWithDuration(2.0, animations: { 
            self.greenView.frame = CGRect(x: 150, y: 150, width: 150, height: 150)
            self.greenView.backgroundColor = UIColor.blueColor()
            }) { (_) in
                print("动画完成blockAni2()")
        }
    }
    
    private func blockAni3() {
        UIView.animateWithDuration(1.0, delay: 1.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: {
            self.greenView.frame = CGRect(x: 150, y: 290, width: 190, height: 150)
            self.greenView.backgroundColor = UIColor.yellowColor()
            }) { (_) in
                print("动画完成blockAni3()")
        }
    }
    
    private func blockAni4() {
        UIView.animateWithDuration(2, delay: 1, usingSpringWithDamping: 0.2, initialSpringVelocity: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.greenView.frame = CGRect(x: 200, y: 290, width: 200, height: 200)
            self.greenView.backgroundColor = UIColor.cyanColor()
            }) { (_) in
                print("动画完成blockAni4()")
        }
    }
    
    private func blockAni5() {
        UIView.animateKeyframesWithDuration(5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1.0/4, animations: {
                self.greenView.backgroundColor = UIColor.redColor()
            })
            
            UIView.addKeyframeWithRelativeStartTime(1.0/4, relativeDuration: 1.0/4, animations: { 
                self.greenView.backgroundColor = UIColor.blackColor()
                self.greenView.frame.size = CGSize(width: 50, height: 50)
            })
            
            UIView.addKeyframeWithRelativeStartTime(2.0/4, relativeDuration: 1.0/4, animations: { 
                self.greenView.backgroundColor = UIColor.yellowColor()
            })
            UIView.addKeyframeWithRelativeStartTime(3.0/4, relativeDuration: 1.0/4, animations: { 
                self.greenView.backgroundColor = UIColor.blueColor()
                self.greenView.frame.size = CGSize(width: 250, height: 250)
            })
            
            
            
            }) { (_) in
                print("动画完成blockAni5()")
        }
    }
    
    
    
    @IBAction func start1(sender: AnyObject) {
        blockAni1()
        
    }

    @IBAction func start2(sender: AnyObject) {
        blockAni2()
    }
 
    @IBAction func start3(sender: AnyObject) {
        blockAni3()
    }

    @IBAction func start4(sender: AnyObject) {
        blockAni4()
    }
    
    @IBAction func start5(sender: AnyObject) {
        blockAni5()
    }
    
    
    
}
