//
//  Animation03ViewController.swift
//  动画学习Demo
//
//  Created by zhangkuo on 16/9/18.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class Animation03ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1(sender: AnyObject) {
        //单个视图的过渡效果
        UIView.transitionWithView(view1, duration: 1.0, options: [UIViewAnimationOptions.CurveEaseInOut, .TransitionFlipFromBottom], animations: {
            self.view1.backgroundColor = UIColor.blueColor()
            }) { (_) in
                print("动画完成")
        }
        
        
    }
    @IBAction func button2(sender: AnyObject) {
//        let view2 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        let view2 = UIView(frame: view1.frame)
        
        view2.backgroundColor = UIColor.redColor()
        UIView.transitionFromView(view1, toView: view2, duration: 2, options: UIViewAnimationOptions.TransitionCurlUp) { (_) in
            print("done")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
