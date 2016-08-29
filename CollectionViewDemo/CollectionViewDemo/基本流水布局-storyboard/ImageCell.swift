//
//  ImageCell.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var dotaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.orangeColor()
    }
    
    
    
    
}
