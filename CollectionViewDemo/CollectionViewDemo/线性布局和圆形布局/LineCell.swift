//
//  LineCell.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/30.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class LineCell: UICollectionViewCell {

    @IBOutlet weak var lineImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //给图片加上边框效果
//        layer.borderColor = UIColor.blackColor().CGColor
//        layer.borderWidth = 4.0
        
        layer.cornerRadius = 30
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }

}
